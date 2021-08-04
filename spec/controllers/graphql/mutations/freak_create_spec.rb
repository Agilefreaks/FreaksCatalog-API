# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {git
        query: File.read('spec/fixtures/requests/mutations/freak_create.graphql')
      }
    end

    it { is_expected.to match_response_for(mutation: :createFreak, sample: :create_freak) }
  end
end
