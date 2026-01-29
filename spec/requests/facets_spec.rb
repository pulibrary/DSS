require 'rails_helper'

RSpec.describe 'facets' do
  it 'has a page where you can explore all the values of the subject_geo_facet (country) facet' do
    get '/catalog/facet/subject_geo_facet'
    expect(response.body).to include 'Indonesia'
    expect(response.body).to include 'Libya'
    expect(response.body).to include 'Spain'
    expect(response.body).to include 'Uganda'
  end
end
