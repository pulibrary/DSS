# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'countries/new', type: :view do
  before do
    assign(:country, Country.new(
                       name: 'MyString',
                       key_term_id: 1
                     ))
  end

  it 'renders new country form' do
    render

    assert_select 'form[action=?][method=?]', countries_path, 'post' do
      assert_select 'input#country_name[name=?]', 'country[name]'

      assert_select 'input#country_key_term_id[name=?]', 'country[key_term_id]'
    end
  end
end
