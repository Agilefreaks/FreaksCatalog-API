# frozen_string_literal: true

RSpec.describe Freak, type: :model do
  describe '#name' do
    subject(:name) { described_class.create(first_name: 'John', last_name: 'Doe').name }

    it { is_expected.to eq 'John Doe' }
  end
end
