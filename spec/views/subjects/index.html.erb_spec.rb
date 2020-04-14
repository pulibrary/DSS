# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'subjects/index', type: :view do
  before do
    assign(:subjects, [
             Subject.create!(
               name: 'Name',
               key_term_id: 2
             ),
             Subject.create!(
               name: 'Name',
               key_term_id: 2
             )
           ])
  end

  it 'renders a list of subjects' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
