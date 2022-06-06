# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CatalogController, type: :routing do
  it 'renders CatalogController#index at /catalog' do
    expect(get: '/catalog').to route_to(controller: 'catalog', action: 'index')
  end
end
