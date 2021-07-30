# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GraphqlController, type: :controller do
  let(:params) do
    {
      query: File.read('spec/fixtures/requests/queries/freaks.graphql')
    }
  end

  subject { post :execute, params: params, as: :json }

  it { is_expected.to match_response_for(query: :freaks, sample: :default) }
end
