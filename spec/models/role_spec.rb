# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  describe '#name' do
    subject(:name) { described_class.create(name: 'Software developer').name }

    it { is_expected.to eq 'Software developer' }
  end
end
