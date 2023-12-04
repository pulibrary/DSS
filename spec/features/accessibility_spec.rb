# frozen_string_literal: true

require "rails_helper"

describe "accessibility", :js, type: :feature do
  context "when visiting home page" do
    before do
      visit "/catalog"
    end

    it "complies with wcag" do
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
    end
  end

  context "when visiting a resource page" do
    before do
      visit "/catalog/resource6"
    end

    it "complies with wcag2aa wcag21a" do
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
    end
  end
end
