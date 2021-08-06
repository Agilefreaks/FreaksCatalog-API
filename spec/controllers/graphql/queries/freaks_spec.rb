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

    it { is_expected.to match_response_for(query: :Freaks, sample: :freak_spec) }
  end
end
