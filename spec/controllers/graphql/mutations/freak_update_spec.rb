# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:norm_id) { create(:norm).id }
    let(:role_id) { create(:role).id }
    let(:level_id) { create(:level).id }
    let(:freak_id) { create(:freak).id }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_update.graphql'),
        variables: {
          id: freak_id,
          firstName: 'Dorel',
          lastName: 'zidarul',
          description: 'priceput la tot prin casa',
          email: 'dorel.zidarul@gmail.com',
          norm_id: norm_id,
          role_id: role_id,
          level_id: level_id
        }

      }
    end

    it { is_expected.to match_response_for(mutation: :freak_update, sample: :freak_update) }

    context 'when freak does not exist' do
      let(:freak_id) { 231_231 }

      it { is_expected.to match_response_for(mutation: :freak_update, sample: :missing_id) }
    end

    context 'when norm does not exist' do
      let(:norm_id) { 8551 }

      it { is_expected.to match_response_for(mutation: :freak_update, sample: :missing_norm) }
    end

    context 'when role does not exist' do
      let(:role_id) { 8551 }

      it { is_expected.to match_response_for(mutation: :freak_update, sample: :missing_role) }
    end

    context 'when level does not exist' do
      let(:level_id) { 232_323 }

      it { is_expected.to match_response_for(mutation: :freak_update, sample: :missing_level) }
    end
  end
end
