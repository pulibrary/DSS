# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Catalog home page', type: :system do
  it 'has a form that routes to /catalog' do
    visit '/catalog'
    form = find('form', class: 'search-query-form')
    expect(form[:action]).to end_with('/catalog')
  end
end