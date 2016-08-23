require 'rails_helper'

RSpec.describe "DataFiles", type: :request do
  describe "GET /data_files" do
    it "works! (now write some real specs)" do
      get data_files_path
      expect(response).to have_http_status(200)
    end
  end
end
