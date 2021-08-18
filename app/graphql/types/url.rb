# frozen_string_literal: true

module Types
  class Url < Types::BaseScalar
    description 'A valid URL, transported as a string'

    def self.coerce_input(input_value, _context)
      url = URI.parse(input_value)

      return url if url.is_a?(URI::HTTP) || url.is_a?(URI::HTTPS)
    end

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end
  end
end
