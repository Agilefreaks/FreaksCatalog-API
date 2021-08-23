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
      create(:freak, :with_project, first_name: 'Ion')
      create(:freak, :with_project, first_name: 'Gheorghe')
    end

    context 'with a full_time freak' do
      it 'returns a full_time freak' do
        query_freaks

        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response.dig(:data, :freaks, :edges, 0, :node, :norm, :name)).to eq 'full_time'
      end
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
end
