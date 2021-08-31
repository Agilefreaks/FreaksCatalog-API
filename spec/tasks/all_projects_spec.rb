# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:params) do
      {
        query: File.read('spec/fixtures/requests/queries/all_projects.graphql')
      }
    end

    before do
      first_freak = create(:freak)
      second_freak = create(:freak)

      first_project = create(:project)
      second_project = create(:project)

      create(:freaks_projects, freak: first_freak, project: first_project)
      create(:freaks_projects, freak: first_freak, project: second_project)
      create(:freaks_projects, freak: second_freak, project: second_project)
    end

    it { is_expected.to match_response_for(query: :all_projects, sample: :all_projects) }

    context 'with all_of projects params' do
      before do
        params[:variables] = {
          allOf: [3]
        }
      end

      it { is_expected.to match_response_for(query: :all_projects, sample: :all_projects_filtered) }
    end
  end
end
