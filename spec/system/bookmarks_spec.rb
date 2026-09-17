# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Bookmarks page', type: :system do
  it 'has a bookmarked record' do
    visit '/catalog'
    fill_in 'q', with: 'Indonesia'
    click_button 'search'
    first(".toggle-bookmark *[data-checkboxsubmit-target='span']").click
    expect(page).to have_css("#bookmarks_nav > span", text: '1')
    visit '/bookmarks'
    expect(page).to have_text('Indonesia - Census of Agriculture 2003')
  end
end
