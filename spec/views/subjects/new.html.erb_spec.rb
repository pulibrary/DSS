# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'subjects/new', type: :view do
  before do
    assign(:subject, Subject.new(
                       name: 'MyString',
                       key_term_id: 1
                     ))
  end

  it 'renders new subject form' do
    render

    assert_select 'form[action=?][method=?]', subjects_path, 'post' do
      assert_select 'input#subject_name[name=?]', 'subject[name]'

      assert_select 'input#subject_key_term_id[name=?]', 'subject[key_term_id]'
    end
  end
end
