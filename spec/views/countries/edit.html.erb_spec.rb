# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'countries/edit', type: :view do
  let!(:country) { Country.create!(name: 'MyString', key_term_id: 1) }

  before do
    assign(:country, country)
    assign(:last_update, country.updated_at.localtime.to_fs(:date_twelve_hour))
  end

  it 'renders the edit country form' do
    render

    assert_select 'form[action=?][method=?]', country_path(country), 'post' do
      assert_select 'input#country_name[name=?]', 'country[name]'

      assert_select 'input#country_key_term_id[name=?]', 'country[key_term_id]'
    end
  end
end
