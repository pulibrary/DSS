# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studies/show', type: :view do
  before do
    @study = assign(:study, Study.create!(
                              legacy_id: 2,
                              studynum: 3,
                              title: 'Title',
                              medium: 'Medium',
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
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Icpsr Num/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(%r{catalog/4})
  end
end
