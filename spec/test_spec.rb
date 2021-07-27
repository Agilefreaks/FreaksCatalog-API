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

RSpec.describe do
  describe User do
    it 'says hello' do
      user = User.new('Rails')
      expect(user.hello).to eq('Hello, Rails!')
    end
  end
end
