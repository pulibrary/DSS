# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Flash messages', type: :system do
  it 'has close button' do
    visit '/catalog'
    user1 = FactoryBot.create(:user, username: 'username1')
    login_as user1
    visit '/catalog'
    click_button(user1.username)
    click_link('Log Out')
    visit '/catalog'
    expect(page).to have_text('Signed out successfully.')
    find('#main-flashes .btn-close').click
    expect(page).to have_no_content('Signed out successfully.')
  end
end
