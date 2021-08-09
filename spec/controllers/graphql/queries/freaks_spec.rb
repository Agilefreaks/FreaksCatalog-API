# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/freaks.graphql')
      }
    end

    before :each do
      create(:freak, name: 'Ion')
      create(:freak, name: 'Gheorghe')
    end

    it { is_expected.to match_response_for(query: :freaks, sample: :freaks) }

    context 'pagination params are provided' do
      before :each do
        params[:variables] = {
          before: 'Mg',
          last: 1
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :freaks_pagination) }
    end
  end
end
