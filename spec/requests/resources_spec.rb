# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Resources', type: :request do
  before do
    sign_in FactoryBot.create(:user)
  end

  describe 'GET /resources' do
    it 'works! (now write some real specs)' do
      get resources_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /resources/new' do
    it 'can create a new resource with a country' do
      expect(Resource.count).to eq 4
      post resources_path, params: { resource: { country_ids: %w[1 2] } }
      expect(flash[:notice]).to eq("Resource was successfully created.")
      expect(response).to be_a_redirect
      expect(Resource.count).to eq 5
      expect(Resource.last.countries.size).to eq 2
    end

    it 'can create a new resource with all the countries' do
      expect(Resource.count).to eq 4
      post resources_path, params: { resource: { country_ids: ["all"] } }
      expect(flash[:notice]).to eq("Resource was successfully created.")
      expect(response).to be_a_redirect
      expect(Resource.count).to eq 5
      expect(Resource.last.countries.size).to eq 4
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          country_ids: %w[1 2]
        }
      end
      let(:new_attributes) do
        {
          country_ids: ['all']
        }
      end

      it 'adds more countries to the resource' do
        resource = Resource.create! valid_attributes
        expect(resource.countries.size).to eq(2)
        patch resource_url(resource), params: { resource: new_attributes }
        resource.reload
        expect(resource.countries.size).to eq(4)
      end
    end
  end
end
