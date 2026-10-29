# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Countries', type: :request do
  describe 'GET /countries' do
    it 'works!' do
      sign_in create(:user)
      get countries_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /merge_countries' do
    it 'does not allow non-admins' do
      sign_in create(:user)
      get "/merge_countries"
      expect(response).to have_http_status(:forbidden)
    end

    it 'allows admins' do
      sign_in create(:user, role: 'admin')
      get "/merge_countries"
      expect(response).not_to have_http_status(:forbidden)
    end
  end

  describe 'POST /merge_countries' do
    it 'does not allow non-admins' do
      old = Country.create(name: 'Old')
      new = Country.create(name: 'New')

      sign_in create(:user)
      post "/merge_countries?new_id=#{new.id}&old_id=#{old.id}"

      expect(response).to have_http_status(:forbidden)
      expect(Country.find_by(name: 'Old')).to be_present
    end

    it 'allows admins' do
      old = Country.create(name: 'Old')
      new = Country.create(name: 'New')

      sign_in create(:user, role: 'admin')
      post "/merge_countries?new_id=#{new.id}&old_id=#{old.id}"

      expect(response).not_to have_http_status(:forbidden)
      expect(Country.find_by(name: 'Old')).to be_nil
    end
  end
end
