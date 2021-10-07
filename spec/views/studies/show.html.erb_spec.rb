# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studies/show', type: :view do
  let(:study) do
    study = assign(:study, Study.create!(
                             legacy_id: 2,
                             studynum: 3,
                             title: 'Title',
                             medium: 'Server',
                             icpsr_num: 'Icpsr Num',
                             url: 'Url',
                             directory: 'Directory',
                             folder: 'Folder',
                             r_flag: false,
                             auto_refresh: false,
                             note: 'MyText',
                             roper: 'Roper',
                             voyager_id: 4
                           ))
    study
  end

  before do
    @study = study
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Icpsr Num/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(%r{catalog/4})
    expect(rendered).to include("If you are at a computer connected to the Princeton Network, you should be able to access it through the following links:</p>\n\n      <p><a href=\"http://dss2.princeton.edu/data/Folder\">See all included Files</a></p>\n")
  end

  context "when the study is a CD" do
    before do
      study.medium = 'CD'
    end

    it 'renders attributes in <p>' do
      render
      expect(rendered).to match(/3/)
      expect(rendered).to match(/Icpsr Num/)
      expect(rendered).to match(/Url/)
      expect(rendered).to match(/MyText/)
      expect(rendered).to match(%r{catalog/4})
      expect(rendered).not_to include("If you are at a computer connected to the Princeton Network, you should be able to access it through the following links:</p>\n\n      <p><a href=\"http://dss2.princeton.edu/data/Folder\">See all included Files</a></p>\n")
      expect(rendered).to include("<p>Please go to the Microforms Office - Firestone A Floor and request CD-ROM #3</p>\n")
    end
  end
end
