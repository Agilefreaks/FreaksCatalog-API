# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:freak_technology) { create(:freak_technology) }
    let(:technology_name) { create(:technology) }
    let(:params) do
      {
        query: File.read('spec/fixtures/requests/mutations/remove_technology_from_freak.graphql'),
        variables: {
          freak_id: freak_technology.freak_id,
          name: technology_name.name
        }
      }
    end

    before do
      create(:freak)
      create(:technology)
    end



      it { is_expected.to match_response_for(mutation: :remove_technology_freak, sample: :remove_technology_freak) }


  end
end
