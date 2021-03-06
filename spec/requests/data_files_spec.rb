# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DataFiles', type: :request do
  before do
    sign_in FactoryBot.create(:user)
  end

  describe 'GET /data_files' do
    it 'works! (now write some real specs)' do
      get data_files_path
      expect(response).to have_http_status(:ok)
    end
  end
end
