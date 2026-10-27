# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'searching' do
  it 'can search by country' do
    visit '/catalog'
    fill_in 'search for', with: 'Indonesia'
    click_button 'Search'

    expect(page.text).to include 'Indonesia - Census of Agriculture 2003'
    expect(page.text).to include 'Air quality valuation using online surveys in three Asian megacities'
  end
end
