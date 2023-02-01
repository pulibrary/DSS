# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Flash messages', type: :system do
  it 'has close button' do
    visit '/catalog'
    login_as FactoryBot.create(:user)
    visit '/catalog'
    click_button('User')
    click_link('Log Out')
    visit '/catalog'
    expect(page).to have_text('Signed out successfully.')
  end
end
