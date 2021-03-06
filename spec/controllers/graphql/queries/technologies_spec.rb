# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/technologies.graphql')
      }
    end

    before do
      create(:technology, :ruby)
      create(:technology, :java)
    end

    it { is_expected.to match_response_for(query: :technologies, sample: :technologies) }
  end
end
