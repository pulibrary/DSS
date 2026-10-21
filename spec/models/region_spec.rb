# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Region, type: :model do
  it "can't make duplicate regions" do
    described_class.create(name: 'My nice test region')
    expect do
      described_class.create(name: 'My nice test region')
    end.to raise_error ActiveRecord::RecordNotUnique
  end

  it "can't make a region without a name" do
    expect do
      described_class.create(name: nil)
    end.to raise_error ActiveRecord::NotNullViolation
  end

  it 'has a country map as a hash' do
    mapping = described_class.country_map
    expect(mapping['Africa']).to include a_hash_including(label: 'Benin')
    expect(mapping['Africa']).to include a_hash_including(label: 'Eritrea')
    expect(mapping['Africa']).to include a_hash_including(label: 'Tanzania')
  end
end
