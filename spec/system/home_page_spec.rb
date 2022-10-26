# frozen_string_literal: true

require 'rails_helper'

describe "home page", type: :system, js: true do
  it 'HTML start and end tags are nested properly' do
    visit '/catalog'
    expect(html_errors('Unexpected end tag')).to be_empty
  end
end

def html_errors(error_name)
  parsed = Nokogiri::HTML(html)
  parsed.errors.select { |error| error.to_s.match error_name }
end
