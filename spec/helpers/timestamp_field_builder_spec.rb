require 'rails_helper'

RSpec.describe TimestampFieldBuilder do
  it 'creates <select> elements with the correct names' do
    builder = described_class.new
    rendered = builder.labelled_datetime_select(
      DataFile.new,
      nil,
      DataFilesController.new.view_context,
      :timestamp
    )
    parsed = Nokogiri::HTML::DocumentFragment.parse rendered
    input_names = parsed.css('select').map { |element| element.attribute('name').value }

    expect(input_names).to eq(['data_file[timestamp(1i)]', 'data_file[timestamp(2i)]', 'data_file[timestamp(3i)]', 'data_file[timestamp(4i)]', 'data_file[timestamp(5i)]'])
  end
end
