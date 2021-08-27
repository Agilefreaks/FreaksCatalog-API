# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject(:query_freaks) { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/norms.graphql')
      }
    end

    before do
      create(:norm)
    end

    it { is_expected.to match_response_for(query: :norms, sample: :norms) }
  end
end
