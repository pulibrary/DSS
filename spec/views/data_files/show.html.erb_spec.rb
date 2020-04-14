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

    expect(rendered).to match(/2/)
    expect(rendered).to match(/Files/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/100/)
    expect(rendered).to match(/Line Count/)
    expect(rendered).to match(/Line Length/)
    expect(rendered).to match(/Part/)
    expect(rendered).to match(/File Type A/)
    expect(rendered).to match(/File Type B/)
    expect(rendered).to match(/Flag One/)
    expect(rendered).to match(/Flag Two/)
    expect(rendered).to match(/File Type A/)
    expect(rendered).to match(/File Type Tech/)
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Permission/)
    expect(rendered).to match(/4/)
  end
end
