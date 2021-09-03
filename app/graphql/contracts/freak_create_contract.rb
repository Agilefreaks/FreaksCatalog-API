# frozen_string_literal: true

module Contracts
  class FreakCreateContract < Dry::Validation::Contract
    params do
      required(:first_name).filled(:string)
    end

  end
end