require 'rails_helper'

RSpec.describe "resources/index", type: :view do
  before(:each) do
    assign(:resources, [
      Resource.create!(
        :name => "Name",
        :resource_id => 2,
        :url => "Url",
        :blurb => "MyText",
        :sample => "Sample",
        :principal_investigator => "Principal Investigator",
        :producer => "Producer",
        :distributor => "Distributor",
        :version => "Version",
        :more_detail_url => "More Detail Url",
        :resource_type => "Resource Type"
      ),
      Resource.create!(
        :name => "Name",
        :resource_id => 2,
        :url => "Url",
        :blurb => "MyText",
        :sample => "Sample",
        :principal_investigator => "Principal Investigator",
        :producer => "Producer",
        :distributor => "Distributor",
        :version => "Version",
        :more_detail_url => "More Detail Url",
        :resource_type => "Resource Type"
      )
    ])
  end

  it "renders a list of resources" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Sample".to_s, :count => 2
    assert_select "tr>td", :text => "Principal Investigator".to_s, :count => 2
    assert_select "tr>td", :text => "Producer".to_s, :count => 2
    assert_select "tr>td", :text => "Distributor".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "More Detail Url".to_s, :count => 2
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
  end
end
