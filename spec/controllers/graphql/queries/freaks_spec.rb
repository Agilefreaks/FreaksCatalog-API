# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject(:query_freak) { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/freaks.graphql')
      }
    end
    before do
      role = create(:role, name: 'Software developer')
      create(:freak, role_id: role.id)
    end
    it 'return a freak role' do
      query_freak
      parsed_response = JSON.parse(response.body, symbolize_names: true)

    before do
      create(:freak, :with_project)
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
    it 'return a freak role' do
      query_freak
      parsed_response = JSON.parse(response.body, symbolize_names: true)
      expect(parsed_response.dig(:data, :freaks, :edges, 0, :node, :role, :name)).to eq 'Software developer'
    end
    end
end
