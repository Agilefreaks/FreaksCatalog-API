# frozen_string_literal: true

require 'rails_helper'
module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject(:execute_query) { post :execute, params: params, as: :json }

    before { create(:freak) }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/freaks_pagination.graphql')
      }
    end

    it { is_expected.to match_response_for(query: :GetFreaks, sample: :freaks_pagination) }
  end
end
