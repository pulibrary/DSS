require "rails_helper"

RSpec.describe DataFilesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/data_files").to route_to("data_files#index")
    end

    it "routes to #new" do
      expect(:get => "/data_files/new").to route_to("data_files#new")
    end

    it "routes to #show" do
      expect(:get => "/data_files/1").to route_to("data_files#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/data_files/1/edit").to route_to("data_files#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/data_files").to route_to("data_files#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/data_files/1").to route_to("data_files#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/data_files/1").to route_to("data_files#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/data_files/1").to route_to("data_files#destroy", :id => "1")
    end

  end
end
