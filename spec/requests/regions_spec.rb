# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Regions', type: :request do
  before do
    sign_in create(:user)
  end

  describe 'GET /regions' do
    it 'works!' do
      get regions_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /region_country_map' do
    it 'is a json with the regions and their associated countries' do
      get '/region_country_map'
      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['Asia']).to include a_hash_including('label' => 'Kazakhstan')
      expect(response.parsed_body['Asia']).to include a_hash_including('label' => 'Singapore')
    end
  end
end
