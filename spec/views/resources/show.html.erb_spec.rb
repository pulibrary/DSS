# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'resources/show', type: :view do
  before do
    @resource = assign(:resource, Resource.create!(
                                    name: 'Name',
                                    resource_id: 2,
                                    url: 'Url',
                                    blurb: 'MyText',
                                    sample: 'Sample',
                                    principal_investigator: 'Principal Investigator',
                                    producer: 'Producer',
                                    distributor: 'Distributor',
                                    version: 'Version',
                                    more_detail_url: 'More Detail Url',
                                    resource_type: 'Resource Type'
                                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include('Name')
    expect(rendered).to include('2')
    expect(rendered).to include('Url')
    expect(rendered).to include('MyText')
    expect(rendered).to include('Sample')
    expect(rendered).to include('Principal Investigator')
    expect(rendered).to include('Producer')
    expect(rendered).to include('Distributor')
    expect(rendered).to include('Version')
    expect(rendered).to include('More Detail Url')
    expect(rendered).to include('Resource Type')
  end
end
