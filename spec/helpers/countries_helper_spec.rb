# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountriesHelper, type: :helper do
  let(:options_string) do
    "<option value=\"all\">All Countries</option>\n" \
    "<option value=\"1\">Indonesia</option>\n" \
    "<option value=\"2\">Libya</option>\n" \
    "<option value=\"3\">Spain</option>\n" \
    "<option value=\"4\">Uganda</option>"
  end

  it 'creates a list of countries for select form, including "All Countries"' do
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to eq(options_string)
  end
end
