require "spec_helper"

RSpec.describe do
  class User
    def initialize(name)
      @name = name
    end

    def hello
      "Hello, #{@name}!"
    end
  end

  describe User do
    it "says hello" do
      user = User.new("Rails")
      user.hello.should == "Hello, Rails!"
    end
  end
end
