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
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Sample/)
    expect(rendered).to match(/Principal Investigator/)
    expect(rendered).to match(/Producer/)
    expect(rendered).to match(/Distributor/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/More Detail Url/)
    expect(rendered).to match(/Resource Type/)
  end
end
