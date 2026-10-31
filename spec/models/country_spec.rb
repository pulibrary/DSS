# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Country, type: :model do
  it "can't make duplicate countries" do
    described_class.create(name: 'My nice test country')
    expect do
      described_class.create(name: 'My nice test country')
    end.to raise_error ActiveRecord::RecordNotUnique
  end

  it "can't make a country without a name" do
    expect do
      described_class.create(name: nil)
    end.to raise_error ActiveRecord::NotNullViolation
  end

  describe '#merge_countries' do
    it 'can merge two countries' do
      old = described_class.create(name: 'Old')
      new = described_class.create(name: 'New')
      described_class.merge_countries(old:, new:)
      expect(described_class.find_by(name: 'Old')).to be_nil
      expect(described_class.find_by(name: 'New')).to be_present
    end

    it 'moves the regions of the old country on to the new country' do
      old = described_class.create(name: 'Old') do |country|
        country.regions = [Region.find_or_create_by(name: 'Region 1'), Region.find_or_create_by(name: 'Region 2')]
      end
      new = described_class.create(name: 'New')
      described_class.merge_countries(old:, new:)
      expect(new.reload.regions.pluck(:name)).to eq ['Region 1', 'Region 2']
    end

    it 'moves the resources of the old country on to the new country' do
      old = described_class.create(name: 'Old') do |country|
        Resource.create(name: 'Resource 1', countries: [country])
        Resource.create(name: 'Resource 2', countries: [country])
      end
      new = described_class.create(name: 'New') do |country|
        Resource.create(name: 'Resource 3', countries: [country])
      end
      described_class.merge_countries(old:, new:)
      expect(new.reload.resources.pluck(:name)).to eq ['Resource 1', 'Resource 2', 'Resource 3']
    end

    it 'moves the studies of the old country on to the new country' do
      old = described_class.create(name: 'Old') do |country|
        Study.create(title: 'Study 1', countries: [country], studynum: '123')
        Study.create(title: 'Study 2', countries: [country], studynum: '456')
      end
      new = described_class.create(name: 'New') do |country|
        Study.create(title: 'Study 3', countries: [country], studynum: '789')
      end
      described_class.merge_countries(old:, new:)
      studies = Study.joins(:countries).where(countries: { id: new.id })
      expect(studies.pluck(:title)).to eq ['Study 1', 'Study 2', 'Study 3']
    end

    it 'reindexes upon merge' do
      solr_connection = instance_double(RSolr::Client, add: nil, commit: nil)
      allow(RSolr).to receive(:connect).and_return(solr_connection)

      old = described_class.create(name: 'Old') do |country|
        Resource.create(name: 'Resource 1', countries: [country])
      end
      new = described_class.create(name: 'New')
      described_class.merge_countries(old:, new:)

      expect(solr_connection).to have_received(:add).with(a_hash_including('subject_geo_facet' => ['New']))
    end
  end
end
