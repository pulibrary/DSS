# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regions/edit', type: :view do
  let(:region) { Region.create!(name: 'MyString', key_term_id: 1) }

  before do
    assign(:region, region)
  end

  it 'renders the edit region form' do
    render

    assert_select 'form[action=?][method=?]', region_path(region), 'post' do
      assert_select 'input#region_name[name=?]', 'region[name]'

      assert_select 'input#region_key_term_id[name=?]', 'region[key_term_id]'
    end
  end
end
