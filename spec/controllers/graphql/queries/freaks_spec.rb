# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/freaks.graphql')
      }
    end

    before do
      create(:freak, first_name: 'Ion')
      create(:freak, first_name: 'Gheorghe')
    end

    it { is_expected.to match_response_for(query: :freaks, sample: :freaks) }

    context 'with pagination params' do
      before do
        params[:variables] = {
          before: 'Mg',
          last: 1
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :freaks_pagination) }
    end
  end

  RSpec.describe Freak, type: :model do
    describe '#name' do
      subject(:name) { described_class.create(first_name: 'John', last_name: 'Doe').name }

      it { is_expected.to eq 'John Doe' }
    end
  end
end
