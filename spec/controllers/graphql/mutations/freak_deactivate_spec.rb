# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:freak_id) { create(:freak).id }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_deactivate.graphql'),
        variables: {
          id: freak_id
        }
      }
    end

    context 'when freak is deactivate' do
      it { is_expected.to match_response_for(mutation: :freak_deactivate, sample: :freak_deactivate) }
    end
  end
end
