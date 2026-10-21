# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe '#to_solr' do
    it 'indexes title' do
      resource = described_class.new(name: 'My title')
      expect(resource.to_solr['title_t']).to eq ['My title']
    end

    it 'indexes countries that do not have a region' do
      countries = [Country.create(name: 'Country 1'), Country.create(name: 'Country 2')]
      resource = described_class.new(countries:)
      expect(resource.to_solr['hierarchical_country_facet']).to eq ['Country 1', 'Country 2']
    end

    it 'indexes countries that have a region' do
      region = Region.create(name: 'Region 1')
      countries = [Country.create(name: 'Country 1', regions: [region]), Country.create(name: 'Country 2', regions: [region])]
      resource = described_class.new(countries:)
      expect(resource.to_solr['hierarchical_country_facet']).to contain_exactly 'Region 1', 'Region 1|||Country 1', 'Region 1|||Country 2'
    end
  end
end
