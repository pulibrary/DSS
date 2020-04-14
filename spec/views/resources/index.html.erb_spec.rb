# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'resources/index', type: :view do
  before do
    assign(:resources, [
             Resource.create!(
               name: 'Name 1',
               resource_id: 201,
               url: 'Url 1',
               blurb: 'MyText 1',
               sample: 'Sample 1',
               principal_investigator: 'Principal Investigator',
               producer: 'Producer',
               distributor: 'Distributor',
               version: 'Version',
               more_detail_url: 'More Detail Url',
               resource_type: 'Resource Type'
             ),
             Resource.create!(
               name: 'Name 2',
               resource_id: 202,
               url: 'Url 2',
               blurb: 'MyText 2',
               sample: 'Sample 2',
               principal_investigator: 'Principal Investigator',
               producer: 'Producer',
               distributor: 'Distributor',
               version: 'Version',
               more_detail_url: 'More Detail Url',
               resource_type: 'Resource Type'
             )
           ])
  end

  it 'renders a list of resources' do
    render

    assert_select 'tr>td', text: 'Name 1'
    assert_select 'tr>td', text: 'Name 2'
    assert_select 'tr>td', text: 201.to_s
    assert_select 'tr>td', text: 202.to_s
    assert_select 'tr>td>a', text: 'Url 1'
    assert_select 'tr>td>a', text: 'Url 2'
    assert_select 'tr>td', text: 'MyText 1'
    assert_select 'tr>td', text: 'MyText 2'
    assert_select 'tr>td', text: 'Sample 1'
    assert_select 'tr>td', text: 'Sample 2'
    assert_select 'tr>td', text: 'Show', count: 2
    assert_select 'tr>td', text: 'Edit', count: 2
    assert_select 'tr>td', text: 'Destroy', count: 2
  end
end
