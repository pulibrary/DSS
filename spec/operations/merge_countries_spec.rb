require 'rails_helper'

RSpec.describe MergeCountries do
  it 'merges two countries' do
    old = Country.create(name: 'Old')
    new = Country.create(name: 'New')
    operation = described_class.new

    expect(operation.call(old_id: old.id, new_id: new.id)).to be_success

    expect(Country.find_by(name: 'Old')).to be_nil
    expect(Country.find_by(name: 'New')).to be_present
  end

  it 'does not allow merge of two identical countries' do
    country = Country.create(name: 'My country')
    operation = described_class.new
    expect(operation.call(old_id: country.id, new_id: country.id)).to be_failure
  end
end
