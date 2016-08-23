require 'rails_helper'

RSpec.describe "data_files/index", type: :view do
  before(:each) do
    assign(:data_files, [
      DataFile.create!(
        :legacy_id => 2,
        :files => "Files",
        :size => "Size",
        :comp_size => "Comp Size",
        :line_count => "Line Count",
        :line_length => "Line Length",
        :part => "Part",
        :file_type_a => "File Type A",
        :file_type_b => "File Type B",
        :flag_one => "Flag One",
        :flag_two => "Flag Two",
        :file_type_a => "File Type A",
        :file_type_tech => "File Type Tech",
        :note => "Note",
        :study_num => 3,
        :permission => "Permission",
        :study_id => 4
      ),
      DataFile.create!(
        :legacy_id => 2,
        :files => "Files",
        :size => "Size",
        :comp_size => "Comp Size",
        :line_count => "Line Count",
        :line_length => "Line Length",
        :part => "Part",
        :file_type_a => "File Type A",
        :file_type_b => "File Type B",
        :flag_one => "Flag One",
        :flag_two => "Flag Two",
        :file_type_a => "File Type A",
        :file_type_tech => "File Type Tech",
        :note => "Note",
        :study_num => 3,
        :permission => "Permission",
        :study_id => 4
      )
    ])
  end

  it "renders a list of data_files" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Files".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Comp Size".to_s, :count => 2
    assert_select "tr>td", :text => "Line Count".to_s, :count => 2
    assert_select "tr>td", :text => "Line Length".to_s, :count => 2
    assert_select "tr>td", :text => "Part".to_s, :count => 2
    assert_select "tr>td", :text => "File Type A".to_s, :count => 2
    assert_select "tr>td", :text => "File Type B".to_s, :count => 2
    assert_select "tr>td", :text => "Flag One".to_s, :count => 2
    assert_select "tr>td", :text => "Flag Two".to_s, :count => 2
    assert_select "tr>td", :text => "File Type A".to_s, :count => 2
    assert_select "tr>td", :text => "File Type Tech".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Permission".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
