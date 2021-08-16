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

    it 'returns a full_time freak' do
      query_freaks

      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response.dig(:data, :freaks, :edges, 0, :node, :norm, :name)).to eq 'full_time'
    end
  end
end
