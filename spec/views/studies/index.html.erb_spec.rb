# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'studies/index', type: :view do
  before do
    assign(:studies, [
             Study.create!(
               legacy_id: 2,
               studynum: 303,
               title: 'Title 1',
               medium: 'Medium 1',
               icpsr_num: 'Icpsr Num',
               url: 'Url 1',
               directory: 'Directory',
               folder: 'Folder',
               r_flag: false,
               auto_refresh: false,
               note: 'MyText',
               roper: 'Roper',
               voyager_id: 401
             ),
             Study.create!(
               legacy_id: 2,
               studynum: 305,
               title: 'Title 2',
               medium: 'Medium 2',
               icpsr_num: 'Icpsr Num',
               url: 'Url 2',
               directory: 'Directory',
               folder: 'Folder',
               r_flag: false,
               auto_refresh: false,
               note: 'MyText',
               roper: 'Roper',
               voyager_id: 402
             )
           ])
    @user = assign(:user, FactoryBot.create(:user))
  end

  it 'renders a list of studies' do
    render
    puts rendered
    assert_select 'tr>td', text: 303.to_s
    assert_select 'tr>td', text: 305.to_s
    assert_select 'tr>td', text: 'Title 1'
    assert_select 'tr>td', text: 'Title 2'
    assert_select 'tr>td', text: 'Medium 1'
    assert_select 'tr>td', text: 'Medium 2'
    assert_select 'tr>td', text: 'Url 1'
    assert_select 'tr>td', text: 'Url 2'
    assert_select 'tr>td', text: 401.to_s
    assert_select 'tr>td', text: 402.to_s
  end
end
