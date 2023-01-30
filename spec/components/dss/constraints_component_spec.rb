# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dss::ConstraintsComponent, type: :component do
  let(:params) do
    {
      action: 'index', controller: 'catalog',
      q1: 'dogs', f1: 'title',
      op2: 'not', q2: 'cats', f2: 'title',
      op3: '', q3: '', f3: ''
    }
  end
  let(:search_state) { Blacklight::SearchState.new(params, Blacklight::Configuration.new) }
  let(:component) { described_class.new(search_state:) }

  it 'can be instantiated' do
    expect(described_class.new(search_state:)).to be_instance_of(described_class)
  end

  it 'includes the m-3 class' do
    expect(component.classes).to include('m-3')
  end
end
