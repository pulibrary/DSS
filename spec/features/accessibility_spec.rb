# frozen_string_literal: true
require 'rails_helper'

describe 'accessibility', type: :feature, js: true do
  context '/catalog' do
    it 'complies with wcag' do
      visit '/catalog'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
    end
  end
  context 'facet search' do
    it 'complies with wcag' do
      visit '/catalog?f%5Bsubject_geo_facet%5D%5B%5D=Indonesia'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
    end
  end
  context '/resources' do
    it 'complies with wcag' do
      visit '/resources'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        # All accessibility errors are from these two elements
        # https://github.com/pulibrary/DSS/issues/558
        .excluding('.icons a')
        # This one is related to the DataTables library and is addressed by
        # https://github.com/pulibrary/DSS/issues/555
        .excluding('[id^=DataTables_Table_]')
    end
  end
  context '/studies' do
    it 'complies with wcag' do
      visit '/studies'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
  context '/data_files' do
    it 'complies with wcag' do
      visit '/data_files'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
  context '/subjects' do
    it 'complies with wcag' do
      visit '/subjects'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
  context '/countries' do
    it 'complies with wcag' do
      visit '/countries'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
  context '/regions' do
    it 'complies with wcag' do
      visit '/regions'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
end