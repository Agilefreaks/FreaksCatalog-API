# frozen_string_literal: true

require 'rails_helper'
require './db/seeds'

RSpec.describe Seeds do
  subject { action.call }

  let(:action) { -> { described_class.run } }

  it 'populates the entities when called multiple times without polluting' do
    def counts
      seeded_types = [
        Freak,
        Technology,
        Project
      ]

      seeded_types.each_with_object({}) do |type, result|
        result[type.to_s] = type.count
      end
    end

    action.call
    counts.each do |type, count|
      expect(count).not_to eq(0), "Expected seed task to create #{type} items. It didn't..."
    end

    # second call does not pollute
    expect { action.call }.not_to change { counts }
  end
end
