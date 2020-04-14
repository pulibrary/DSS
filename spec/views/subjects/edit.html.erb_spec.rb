# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'subjects/edit', type: :view do
  let(:lsubject) { Subject.create!(name: 'MyString', key_term_id: 1) }

  before do
    assign(:subject, lsubject)
  end

  it 'renders the edit subject form' do
    render

    assert_select 'form[action=?][method=?]', subject_path(lsubject), 'post' do
      assert_select 'input#subject_name[name=?]', 'subject[name]'

      assert_select 'input#subject_key_term_id[name=?]', 'subject[key_term_id]'
    end
  end
end
