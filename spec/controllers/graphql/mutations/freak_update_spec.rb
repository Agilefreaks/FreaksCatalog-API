# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:norm) { create(:norm) }
    let(:role) { create(:role) }
    let(:level) { create(:level) }
    let(:freak) { create(:freak) }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_update.graphql'),
        variables: {
          id: freak.id,
          firstName: 'Dorel',
          lastName: 'zidarul',
          description: 'priceput la tot prin casa',
          email: 'dorel.zidarul@gmail.com',
          norm_id: norm.id,
          role_id: role.id,
          level_id: level.id
        }

      }
    end

    it { is_expected.to match_response_for(mutation: :freak_update, sample: :freak_update) }
  end
end