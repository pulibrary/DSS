# frozen_string_literal: true

require "rails_helper"

RSpec.describe Dss::System::ModalComponent, type: :component do
  let(:rendered) do
    Capybara::Node::Simple.new(render_inline(described_class.new))
  end

  it "renders parts of the" do
    expect(rendered).to have_xpath('.//span[text()="×"]')
    expect(rendered).to have_no_selector('.visually-hidden', text: '×')
  end
end
