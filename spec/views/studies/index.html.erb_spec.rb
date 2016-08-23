require 'rails_helper'

RSpec.describe "studies/index", type: :view do
  before(:each) do
    assign(:studies, [
      Study.create!(
        :legacy_id => 2,
        :studynum => 3,
        :title => "Title",
        :medium => "Medium",
        :icpsr_num => "Icpsr Num",
        :url => "Url",
        :directory => "Directory",
        :folder => "Folder",
        :r_flag => false,
        :auto_refresh => false,
        :note => "MyText",
        :roper => "Roper",
        :voyagre_id => 4
      ),
      Study.create!(
        :legacy_id => 2,
        :studynum => 3,
        :title => "Title",
        :medium => "Medium",
        :icpsr_num => "Icpsr Num",
        :url => "Url",
        :directory => "Directory",
        :folder => "Folder",
        :r_flag => false,
        :auto_refresh => false,
        :note => "MyText",
        :roper => "Roper",
        :voyagre_id => 4
      )
    ])
  end

  it "renders a list of studies" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Medium".to_s, :count => 2
    assert_select "tr>td", :text => "Icpsr Num".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => "Directory".to_s, :count => 2
    assert_select "tr>td", :text => "Folder".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Roper".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
