# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studies/edit', type: :view do
  let(:user) { FactoryBot.create(:user, role: 'admin') }
  let(:study) do
    Study.create!(legacy_id: 1, studynum: 1, title: 'MyString', medium: 'MyString', icpsr_num: 'MyString',
                  url: 'MyString', directory: 'MyString', folder: 'MyString', r_flag: false, auto_refresh: false,
                  note: 'MyText', roper: 'MyString', voyager_id: 1)
  end

  before do
    sign_in(user)
    assign(:study, study)
    assign(:user, FactoryBot.create(:user))
  end

  it 'renders the edit study form' do
    render

    assert_select 'form[action=?][method=?]', study_path(study), 'post' do
      assert_select 'input#study_legacy_id[name=?]', 'study[legacy_id]'

      assert_select 'input#study_studynum[name=?]', 'study[studynum]'

      assert_select 'input#study_title[name=?]', 'study[title]'

      assert_select 'input#study_medium[name=?]', 'study[medium]'

      assert_select 'input#study_icpsr_num[name=?]', 'study[icpsr_num]'

      assert_select 'input#study_url[name=?]', 'study[url]'

      assert_select 'input#study_directory[name=?]', 'study[directory]'

      assert_select 'input#study_folder[name=?]', 'study[folder]'

      assert_select 'input#study_r_flag[name=?]', 'study[r_flag]'

      assert_select 'input#study_auto_refresh[name=?]', 'study[auto_refresh]'

      assert_select 'textarea#study_note[name=?]', 'study[note]'

      assert_select 'input#study_roper[name=?]', 'study[roper]'

      assert_select 'input#study_voyager_id[name=?]', 'study[voyager_id]'
    end
  end
end
