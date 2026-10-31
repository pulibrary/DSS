# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'resources', type: :system do
  let(:user) { create(:user, role: 'admin') }

  before do
    sign_in(user)
  end

  describe('edit page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources/3/edit'
      expect(page).to have_css('.admin')
    end
  end

  describe('index page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources'
      expect(page).to have_css('.admin')
    end
  end

  describe('admin show page') do
    it 'has an .admin class, since it is an admin screen' do
      visit '/resources/3'
      expect(page).to have_css('.admin')
    end
  end
end
