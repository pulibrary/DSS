require 'rails_helper'

RSpec.describe "data_files/new", type: :view do
  before(:each) do
    assign(:data_file, DataFile.new(
      :legacy_id => 1,
      :files => "MyString",
      :size => "MyString",
      :comp_size => "MyString",
      :line_count => "MyString",
      :line_length => "MyString",
      :part => "MyString",
      :file_type_a => "MyString",
      :file_type_b => "MyString",
      :flag_one => "MyString",
      :flag_two => "MyString",
      :file_type_a => "MyString",
      :file_type_tech => "MyString",
      :note => "MyString",
      :study_num => 1,
      :permission => "MyString",
      :study_id => 1
    ))
  end

  it "renders new data_file form" do
    render

    assert_select "form[action=?][method=?]", data_files_path, "post" do

      assert_select "input#data_file_legacy_id[name=?]", "data_file[legacy_id]"

      assert_select "input#data_file_files[name=?]", "data_file[files]"

      assert_select "input#data_file_size[name=?]", "data_file[size]"

      assert_select "input#data_file_comp_size[name=?]", "data_file[comp_size]"

      assert_select "input#data_file_line_count[name=?]", "data_file[line_count]"

      assert_select "input#data_file_line_length[name=?]", "data_file[line_length]"

      assert_select "input#data_file_part[name=?]", "data_file[part]"

      assert_select "input#data_file_file_type_a[name=?]", "data_file[file_type_a]"

      assert_select "input#data_file_file_type_b[name=?]", "data_file[file_type_b]"

      assert_select "input#data_file_flag_one[name=?]", "data_file[flag_one]"

      assert_select "input#data_file_flag_two[name=?]", "data_file[flag_two]"

      assert_select "input#data_file_file_type_a[name=?]", "data_file[file_type_a]"

      assert_select "input#data_file_file_type_tech[name=?]", "data_file[file_type_tech]"

      assert_select "input#data_file_note[name=?]", "data_file[note]"

      assert_select "input#data_file_study_num[name=?]", "data_file[study_num]"

      assert_select "input#data_file_permission[name=?]", "data_file[permission]"

      assert_select "input#data_file_study_id[name=?]", "data_file[study_id]"
    end
  end
end
