# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Freak, type: :model do
  context 'with validation test' do
    let(:user) { build(:freak) } # user.new({})

    it 'is ensures name present' do
      p build(:freak)
      p build(:freak)
      p build(:freak)
      p build(:freak)
    end
  end
end
