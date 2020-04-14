# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Subjects', type: :request do
  before do
    sign_in FactoryBot.create(:user)
  end

  describe 'GET /subjects' do
    it 'works! (now write some real specs)' do
      get subjects_path
      expect(response).to have_http_status(:ok)
    end
  end
end
