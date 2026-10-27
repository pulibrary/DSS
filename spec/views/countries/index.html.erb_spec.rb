# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'countries/index', type: :view do
  before do
    assign(:countries, [
             Country.create!(
               name: 'Name 1',
               key_term_id: 2
             ),
             Country.create!(
               name: 'Name 2',
               key_term_id: 2
             )
           ])
  end

  it 'renders a list of countries' do
    render
    assert_select 'tr>td', text: 'Name 1'
    assert_select 'tr>td', text: 'Name 2'
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
