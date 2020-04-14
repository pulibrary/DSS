# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'regions/new', type: :view do
  before do
    assign(:region, Region.new(
                      name: 'MyString',
                      key_term_id: 1
                    ))
  end

  it 'renders new region form' do
    render

    assert_select 'form[action=?][method=?]', regions_path, 'post' do
      assert_select 'input#region_name[name=?]', 'region[name]'

      assert_select 'input#region_key_term_id[name=?]', 'region[key_term_id]'
    end
  end
end
