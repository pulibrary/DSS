require 'rails_helper'

RSpec.describe 'Show page', type: :system do
  it 'shows a relevant field' do
    visit '/catalog/resource3'
    expect(page).to have_text('Single study')
  end

  it 'has a bookmark checkbox' do
    visit '/catalog/resource3'
    expect(page).to have_css('.toggle-bookmark')
  end

  it 'has no citation link' do
    visit '/catalog/resource3'
    # rubocop:disable-next Capybara/RSpec/NegationMatcherAfterVisit
    expect(page).to have_no_link('Cite')
  end

  it 'does not have an .admin class, since it is not an admin screen' do
    visit '/catalog/resource3'
    # rubocop:disable-next Capybara/RSpec/NegationMatcherAfterVisit
    expect(page).to have_no_css('.admin')
  end
end
