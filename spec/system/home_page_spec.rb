# frozen_string_literal: true

require 'rails_helper'

describe "home page", :js, type: :system do
  it 'HTML start and end tags are nested properly' do
    visit '/catalog'
    expect(html_errors('Unexpected end tag')).to be_empty
  end

  it 'has facets' do
    visit '/catalog'
    expect(page).to have_content('Data Catalog')
    expect(page).to have_content('Quick Links')
  end
end

def html_errors(error_name)
  parsed = Nokogiri::HTML(html)
  parsed.errors.select { |error| error.to_s.match error_name }
end
