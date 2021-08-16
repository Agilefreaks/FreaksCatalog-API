# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/freak_create.graphql')
      }
    end

    context 'when norm exists' do
      before do
        create(:norm, id: 1, name: 'full_time')
      end

      it { is_expected.to match_response_for(mutation: :freak_create, sample: :default) }
    end
  end
end
