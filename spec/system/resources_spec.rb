# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'resources', type: :system do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in(user)
  end

  it 'can create a new resource with a single country' do
    visit '/resources/new'
    expect(page).to have_content('New Resource')
    select('Indonesia', from: 'resource_country_ids')
    click_on('Create Resource')
    expect(page).to have_content('Resource was successfully created.')
    expect(page.all('dd ul li').last.text).to eq('Indonesia')
  end

  it 'can create a new resource with multiple countries' do
    visit '/resources/new'
    expect(page).to have_content('New Resource')
    select('Indonesia', from: 'resource_country_ids')
    select('Libya', from: 'resource_country_ids')
    click_on('Create Resource')
    expect(page).to have_content('Resource was successfully created.')
    # The last two list items will be Indonesia and Libya
    expect(page.all('dd ul li')[-2].text).to eq('Indonesia')
    expect(page.all('dd ul li')[-1].text).to eq('Libya')
  end

  it 'can create a new resource with all available countries' do
    visit '/resources/new'
    expect(page).to have_content('New Resource')
    select('All Countries', from: 'resource_country_ids')
    click_on('Create Resource')
    expect(page).to have_content('Indonesia')
    expect(page).to have_content('Libya')
    expect(page).to have_content('Spain')
    expect(page).to have_content('Uganda')
  end

  describe('edit page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources/3/edit'
      expect(page).to have_selector('.admin')
    end
  end

  describe('index page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources'
      expect(page).to have_selector('.admin')
    end
  end

  describe('admin show page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources/3'
      expect(page).to have_selector('.admin')
    end
  end
end
