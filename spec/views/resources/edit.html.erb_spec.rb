require 'rails_helper'

RSpec.describe "resources/edit", type: :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :name => "MyString",
      :resource_id => 1,
      :url => "MyString",
      :blurb => "MyText",
      :sample => "MyString",
      :principal_investigator => "MyString",
      :producer => "MyString",
      :distributor => "MyString",
      :version => "MyString",
      :more_detail_url => "MyString",
      :resource_type => "MyString"
    ))
  end

  it "renders the edit resource form" do
    render

    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do

      assert_select "input#resource_name[name=?]", "resource[name]"

      assert_select "input#resource_resource_id[name=?]", "resource[resource_id]"

      assert_select "input#resource_url[name=?]", "resource[url]"

      assert_select "textarea#resource_blurb[name=?]", "resource[blurb]"

      assert_select "input#resource_sample[name=?]", "resource[sample]"

      assert_select "input#resource_principal_investigator[name=?]", "resource[principal_investigator]"

      assert_select "input#resource_producer[name=?]", "resource[producer]"

      assert_select "input#resource_distributor[name=?]", "resource[distributor]"

      assert_select "input#resource_version[name=?]", "resource[version]"

      assert_select "input#resource_more_detail_url[name=?]", "resource[more_detail_url]"

      assert_select "input#resource_resource_type[name=?]", "resource[resource_type]"
    end
  end
end
