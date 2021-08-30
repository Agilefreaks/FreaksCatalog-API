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

    context 'when norm and role exists' do
      before do
        create(:freak, :with_project)
      end

      it 'sgeqge' do
         subject
         # byebug
        # response.body
      end

      it { is_expected.to match_response_for(mutation: :freak_create, sample: :freak_create) }
    end
  end
end
