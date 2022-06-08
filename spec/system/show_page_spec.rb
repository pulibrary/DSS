require 'rails_helper'

RSpec.describe 'Show page', type: :system do
  it 'shows a relevant field' do
    visit '/catalog/resource3'
    expect(page).to have_text('Single study')
  end

  it 'has a bookmark checkbox' do
    visit '/catalog/resource3'
    expect(page).to have_selector('#toggle-bookmark_resource3')
  end
end