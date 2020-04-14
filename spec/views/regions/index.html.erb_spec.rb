# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regions/index', type: :view do
  before do
    assign(:regions, [
             Region.create!(
               name: 'Name',
               key_term_id: 2
             ),
             Region.create!(
               name: 'Name',
               key_term_id: 2
             )
           ])
  end

  it 'renders a list of regions' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
