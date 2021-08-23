# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject(:query_freaks) { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/roles.graphql')
      }
    end

    it { is_expected.to match_response_for(query: :roles, sample: :default) }
  end
end
