# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Norm, type: :model do
  describe '#name' do
    subject(:name) { described_class.create(name: 'full_time').name }

    it { is_expected.to eq 'full_time' }
  end
end
