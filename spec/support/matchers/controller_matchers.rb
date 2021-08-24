# frozen_string_literal: true

class JsonAdapter
  def serialize(response)
    JSON.pretty_generate({
                           status: response.status,
                           body: JSON.parse(response.body)
                         })
  end

  def deserialize(serialized)
    JSON.parse(serialized).with_indifferent_access
  end

  def match?(response, fixture)
    fixture[:body] == JSON.parse(response.body)
  end
end

RSpec::Matchers.define :match_response_for do
  def serialized_response
    adapter.serialize(response)
  end

  def request_format
    path_parameters = request.env['action_dispatch.request.path_parameters']
    path_parameters[:format]
  end

  def fixture_path(expected)
    query = expected[:query]
    mutation = expected[:mutation]
    sample = expected[:sample]

    if query
      "spec/fixtures/responses/queries/#{query}/#{sample}.json"
    else
      "spec/fixtures/responses/mutations/#{mutation}/#{sample}.json"
    end
  end

  def ensure_dir(path)
    directory_path = File.dirname(path)

    FileUtils.mkdir_p(directory_path) unless File.directory?(directory_path)
  end

  def write_new_fixture(path)
    return if File.exist?(path) || File.exist?("#{path}.erb")
    return if ENV['DISABLE_FIXTURE_CAPTURE']

    File.write(path, serialized_response)
  end

  def read_fixture(path, options)
    erb_path = "#{path}.erb"

    content = if File.exist?(erb_path)
                evaluate_erb(erb_path, options)
              else
                File.read(path)
              end

    adapter.deserialize(content)
  end

  def adapter
    JsonAdapter.new
  end

  def evaluate_erb(path, context)
    html = File.read(path)
    namespace = OpenStruct.new(context)
    ERB.new(html).result(namespace.instance_eval { binding }).to_s
  end

  match do
    path = fixture_path(expected)
    ensure_dir(path)
    write_new_fixture(path)

    fixture = read_fixture(path, expected)

    fixture[:status] == response.status && adapter.match?(response, fixture)
  end

  failure_message do
    "Expected that #{response} would match #{fixture_path(expected)} "
  end

  failure_message_when_negated do
    "Expected that #{response} would not match #{fixture_path(expected)} "
  end
end
