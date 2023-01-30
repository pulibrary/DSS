# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dss::SearchBarComponent, type: :component do
  let(:component) { described_class.new(url: nil, params: {}) }
  let(:search_action_url) { '/catalog' }
  let(:params_for_search) { { q: 'testParamValue' } }
  let(:blacklight_config) do
    Blacklight::Configuration.new.configure do |config|
      config.view = { list: nil, abc: nil }
    end
  end

  before do
    allow(component).to receive(:blacklight_config).and_return(blacklight_config)
  end

  # Right now we do not have any unique behavior in our SearchBarComponent,
  # but it is needed in order to render our search_bar_component.html.erb
  it 'can be instantiated in the same way as the blacklight version' do
    expect(described_class.new(url: search_action_url, params: params_for_search)).to be_an_instance_of(described_class)
  end
end
