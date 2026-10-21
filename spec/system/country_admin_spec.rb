# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Country administration', :js do
  let(:user) { create(:user, role: 'admin') }

  before { sign_in user }

  def create_country(name)
    visit '/countries'
    click_link 'Add New Country'
    fill_in 'Name', with: name
    yield if block_given?
    click_button 'Create Country'
    expect(page).to have_text 'successfully'
  end

  it 'allows you to create a new country with no region' do
    create_country('My new country')

    visit '/countries'
    expect(page).to have_text 'My new country'
  end

  it 'allows you to create a new country with 1 region' do
    create_country('My country with region') do
      fill_in 'Regions', with: 'Asi'
      find('.lux-autocomplete-result', text: 'Asia').click
    end

    visit '/countries'
    expect(page).to have_text 'My country with region'
  end

  it 'allows you to edit a country that already has a region' do
    create_country('My country with one region') do
      fill_in 'Regions', with: 'Asi'
      find('.lux-autocomplete-result', text: 'Asia').click
    end

    visit '/countries'
    country_row = find('tr', text: 'My country with one region')
    country_row.click_link 'Edit'
    expect(page).to have_text 'Editing Country'
    expect(page).to have_field 'Name', with: 'My country with one region'
    expect(page).to have_css '.selected-item', text: 'Asia'
  end

  it 'shows the regions of a country' do
    create_country('My country') do
      fill_in 'Regions', with: 'Asi'
      find('.lux-autocomplete-result', text: 'Asia').click
    end

    visit '/countries'
    country_row = find('tr', text: 'My country')
    country_row.click_link 'Show'

    expect(page).to have_text 'Asia'
  end
end
