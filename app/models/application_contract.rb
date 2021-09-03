# frozen_string_literal: true

require 'dry/validation'
module Validation
  class NewFreakContract < Dry::Validation::Contract
    freakSchema = Dry::Validation.Schema
    params do
      required(:role_id).value(:integer)
      required(:norm_id).value(:integer)
      required(:level_id).value(:integer)
    end

    rule(settings: role_id) do
      key.failure('must be between the value 1 and the value 4') if value <= 1 && value >= 4
    end

    rule(settings: level_id) do
      key.failure('must be between the value 1 and the value 7') if value <= 1 && value >= 7
    end

    rule(settings: :norm_id) do
      key.failure('must be between the value 1 and the value 2') if value <= 1 && value >= 2
    end

    contract = NewFreakContract.new
    contract.call( role_id: 1, level_id: 1, norm_id: 10)
  end
end