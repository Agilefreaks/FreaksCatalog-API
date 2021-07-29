# frozen_string_literal: true

require 'spec_helper'

class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello, #{@name}!"
  end
end

RSpec.describe User do
  it 'says hello' do
    user = described_class.new('Rails')
    expect(user.hello).to eq('Hello, Rails!')
  end
end
