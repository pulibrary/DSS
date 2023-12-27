# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'data_files/index', type: :view do
  let(:user) { FactoryBot.create(:user, role: 'admin') }

  before do
    sign_in(user)
    assign(:data_files, [
             DataFile.create!(
               legacy_id: 2,
               files: 'Files 1',
               size: 'Size',
               comp_size: 'Comp Size',
               line_count: 'Line Count',
               line_length: 'Line Length',
               part: 'Part',
               file_type_a: 'File Type A1',
               file_type_b: 'File Type B1',
               flag_one: 'Flag One',
               flag_two: 'Flag Two',
               file_type_tech: 'File Type Tech 1',
               note: 'Note 1',
               study_num: 301,
               permission: 'Permission',
               study_id: 401
             ),
             DataFile.create!(
               legacy_id: 2,
               files: 'Files 2',
               size: 'Size',
               comp_size: 'Comp Size',
               line_count: 'Line Count',
               line_length: 'Line Length',
               part: 'Part',
               file_type_a: 'File Type A2',
               file_type_b: 'File Type B2',
               flag_one: 'Flag One',
               flag_two: 'Flag Two',
               file_type_tech: 'File Type Tech 2',
               note: 'Note 2',
               study_num: 302,
               permission: 'Permission',
               study_id: 402
             )
           ])
  end

  it 'renders a list of data_files' do
    render

    assert_select 'tr>td', text: 'Files 1'
    assert_select 'tr>td', text: 'Files 2'
    assert_select 'tr>td', text: 'File Type A1'
    assert_select 'tr>td', text: 'File Type A2'
    assert_select 'tr>td', text: 'File Type B1'
    assert_select 'tr>td', text: 'File Type B2'
    assert_select 'tr>td', text: 'File Type Tech 1'
    assert_select 'tr>td', text: 'File Type Tech 2'
    assert_select 'tr>td', text: 'Note 1'
    assert_select 'tr>td', text: 'Note 2'
    assert_select 'tr>td', text: 301.to_s
    assert_select 'tr>td', text: 302.to_s
    assert_select 'tr>td', text: 401.to_s
    assert_select 'tr>td', text: 402.to_s
    assert_select 'tr>td>a', text: 'Show', count: 2
    assert_select 'tr>td>a', text: 'Edit', count: 2
  end
end
