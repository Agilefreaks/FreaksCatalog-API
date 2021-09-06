# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:norm_id) { create(:norm).id }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_create.graphql'),
        variables: {
          norm_id: norm_id,
          role_id: role_id,
          level_id: level_id
        }
      }
    end

    let(:role_id) { create(:role).id }
    let(:level_id) { create(:level).id }

    it { is_expected.to match_response_for(mutation: :freak_create, sample: :freak_create) }

    context 'when norm does not exist' do
      let(:norm_id) { 231_231 }

      it { is_expected.to match_response_for(mutation: :freak_create, sample: :missing_norm) }
    end

    context 'when role does not exist' do
      let(:role_id) { 8551 }

      it { is_expected.to match_response_for(mutation: :freak_create, sample: :missing_role) }
    end
  end
end
