# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CountriesHelper, type: :helper do
  it 'creates a list of countries for select form, including "All Countries"' do
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to include('All Countries')
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to include('Indonesia')
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to include('Libya')
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to include('Spain')
    expect(helper.countries_for_select(Country.order(:name), 'id', 'name', [])).to include('Uganda')
  end
end
