# frozen_string_literal: true

require 'rails_helper'

module Graphql
  RSpec.describe GraphqlController, type: :controller do
    subject { post :execute, params: params, as: :json }

    let(:first_project) { create(:project, name: 'Project 1') }
    let(:second_project) { create(:project, name: 'Project 2') }
    let(:ruby) { create(:technology, :ruby) }
    let(:java) { create(:technology, :java) }

    let(:params) { { query: File.read('spec/fixtures/requests/queries/freaks.graphql') } }

    before do
      create(:freak, projects: [first_project], technologies: [ruby], first_name: 'Ion')
      create(:freak, projects: [first_project], technologies: [ruby], first_name: 'Vasile')
      create(:freak, projects: [second_project], technologies: [java], first_name: 'Gheorghe')
    end

    it { is_expected.to match_response_for(query: :freaks, sample: :freaks) }

    context 'with pagination params' do
      before do
        params[:variables] = {
          before: 'Mg',
          last: 1
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :freaks_pagination) }
    end

    context 'with all_of projects params' do
      before do
        params[:variables] = {
          filter: {
            projectIds: {
              allOf: [first_project.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :all_projects_filtered) }
    end

    context 'with any_off projects params' do
      before do
        params[:variables] = {
          filter: {
            projectIds: {
              anyOf: [first_project.id, second_project.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :any_projects_filtered) }
    end

    context 'with all_of and any_off projects params' do
      before do
        params[:variables] = {
          filter: {
            projectIds: {
              allOf: [first_project.id],
              anyOf: [first_project.id, second_project.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :all_and_any_filtered) }
    end

    context 'with all_of technology params' do
      before do
        params[:variables] = {
          filter: {
            technologyIds: {
              allOf: [ruby.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :all_technologies_filtered) }
    end

    context 'with any_of technologies params' do
      before do
        params[:variables] = {
          filter: {
            technologyIds: {
              anyOf: [ruby.id, java.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :any_technologies_filtered) }
    end

    context 'with all_of and any_off technologies params' do
      before do
        params[:variables] = {
          filter: {
            technologyIds: {
              allOf: [ruby.id],
              anyOf: [ruby.id, java.id]
            }
          }
        }
      end

      it { is_expected.to match_response_for(query: :freaks, sample: :all_and_any_technologies_filtered) }
    end
  end
end
