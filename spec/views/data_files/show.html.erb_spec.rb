# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'data_files/show', type: :view do
  before do
    assign(:data_file, DataFile.create!(
                         legacy_id: 2,
                         files: 'Files',
                         size: 'Size',
                         comp_size: 100,
                         line_count: 'Line Count',
                         line_length: 'Line Length',
                         part: 'Part',
                         file_type_a: 'File Type A',
                         file_type_b: 'File Type B',
                         flag_one: 'Flag One',
                         flag_two: 'Flag Two',
                         file_type_tech: 'File Type Tech',
                         note: 'Note',
                         study_num: 3,
                         permission: 'Permission',
                         study_id: 4
                       ))
  end

  it 'renders attributes in <p>' do
    render

    expect(rendered).to include('2')
    expect(rendered).to include('Files')
    expect(rendered).to include('Size')
    expect(rendered).to include('100')
    expect(rendered).to include('Line Count')
    expect(rendered).to include('Line Length')
    expect(rendered).to include('Part')
    expect(rendered).to include('File Type A')
    expect(rendered).to include('File Type B')
    expect(rendered).to include('Flag One')
    expect(rendered).to include('Flag Two')
    expect(rendered).to include('File Type A')
    expect(rendered).to include('File Type Tech')
    expect(rendered).to include('Note')
    expect(rendered).to include('3')
    expect(rendered).to include('Permission')
    expect(rendered).to include('4')
  end
end
