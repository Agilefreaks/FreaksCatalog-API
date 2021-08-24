# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/projects.graphql')
      }
    end

    before do
      create_list(:project, 1)
    end

    it { is_expected.to match_response_for(query: :projects, sample: :projects) }
  end
end
