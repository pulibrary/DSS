# frozen_string_literal: true

require 'rails_helper'

describe 'accessibility', :js, type: :feature do
  context 'when visiting /catalog' do
    it 'complies with wcag' do
      visit '/catalog'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
    end
  end

  context 'when visiting facet search' do
    it 'complies with wcag' do
      visit '/catalog?f%5Bsubject_geo_facet%5D%5B%5D=Indonesia'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
    end
  end

  context 'when visiting /resources' do
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

  context 'when visiting /studies' do
    it 'complies with wcag' do
      visit '/studies'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end

  context 'when visiting /data_files' do
    it 'complies with wcag' do
      visit '/data_files'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end

  context 'when visiting /subjects' do
    it 'complies with wcag' do
      visit '/subjects'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end

  context 'when visiting /countries' do
    it 'complies with wcag' do
      visit '/countries'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end

  context 'when visiting /regions' do
    it 'complies with wcag' do
      visit '/regions'
      expect(page).to be_axe_clean
        .according_to(:wcag2a, :wcag2aa, :wcag21a, :wcag21aa)
        .excluding('.icons a')
        .excluding('[id^=DataTables_Table_]')
    end
  end
end