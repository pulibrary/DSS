require 'rails_helper'

RSpec.describe "studies/show", type: :view do
  before(:each) do
    @study = assign(:study, Study.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Medium/)
    expect(rendered).to match(/Icpsr Num/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/Directory/)
    expect(rendered).to match(/Folder/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Roper/)
    expect(rendered).to match(/4/)
  end
end
