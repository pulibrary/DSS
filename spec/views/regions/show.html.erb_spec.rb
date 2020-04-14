# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regions/show', type: :view do
  before do
    @region = assign(:region, Region.create!(
                                name: 'Name',
                                key_term_id: 2
                              ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
  end
end
