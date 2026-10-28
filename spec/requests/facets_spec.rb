require 'rails_helper'

RSpec.describe 'facets' do
  it 'has a page where you can explore all the values of the subject_geo_facet (country) facet' do
    get '/catalog/facet/subject_topic_facet'
    expect(response.body).to include 'African-American Studies', 'Education', 'Elections'
  end
end
