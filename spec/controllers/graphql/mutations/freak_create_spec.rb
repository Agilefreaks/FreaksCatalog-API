# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    let(:norm) { create(:norm) }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_create.graphql'),
        variables: {
          norm_id: norm.id,
          role_id: role.id
        }
      }
    end
    let(:role) { create(:role) }

    subject { post :execute, params: params, as: :json }

    it { is_expected.to match_response_for(mutation: :freak_create, sample: :freak_create) }
  end
end
