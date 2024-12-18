# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Health Check", type: :request do
  describe "GET /health" do
    let(:solr_url) { %r{/solr/admin/cores\?action=STATUS} }

    context 'when all services are up' do
      before do
        stub_request(:get, solr_url)
          .to_return(
            body: { responseHeader: { status: 0 } }.to_json, headers: { 'Content-Type' => 'text/json' }
          )
      end

      it "has a health check" do
        get "/health.json"
        expect(response).to be_successful
      end
    end

    context 'when solr is down' do
      let(:solr_stub) do
        stub_request(:get, solr_url)
          .to_return(
            body: { responseHeader: { status: 500 } }.to_json, headers: { "Content-Type" => "text/json" }
          )
      end

      before { solr_stub }

      it "errors when a service is down" do
        get "/health.json"
        expect(solr_stub).to have_been_requested
        expect(response).not_to be_successful
        expect(response.status).to eq 503
        solr_response = response.parsed_body["results"].find { |x| x["name"] == "Solr" }
        expect(solr_response["message"]).to start_with "The solr has an invalid status"
      end
    end
  end
end