require 'rails_helper'

RSpec.describe 'Search results page', type: :system do
  it 'provides search results' do
    visit '/catalog'
    fill_in 'q', with: 'Indonesia'
    click_button 'search'
    expect(page).to have_text('Indonesia - Census of Agriculture 2003')
  end
end