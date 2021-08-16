# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe '#uri' do
    subject(:uri) { described_class.create(uri: 'http://www.ceva.ro').uri }

    it { is_expected.to eq 'http://www.ceva.ro' }
  end
end
