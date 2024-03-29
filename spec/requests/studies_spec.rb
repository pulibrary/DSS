# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Studies', type: :request do
  before do
    sign_in FactoryBot.create(:user)
  end

  describe 'GET /studies' do
    it 'works! (now write some real specs)' do
      get studies_path
      expect(response).to have_http_status(:ok)
    end
  end

  context 'with an invalid study id' do
    it 'coerces it into a valid integer' do
      get '/studynum/3319%22%3EDun'
      expect(response).to have_http_status(:not_found)
    end
  end

  context 'with a string only study id' do
    it 'responds with not found' do
      get '/studynum/Dun'
      expect(response).to have_http_status(:not_found)
    end
  end
end
