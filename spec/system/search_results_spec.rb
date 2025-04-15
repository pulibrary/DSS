require 'rails_helper'

RSpec.describe 'Search results page', type: :system do
  it 'provides search results' do
    visit '/catalog'
    fill_in 'q', with: 'Indonesia'
    click_button 'search'
    expect(page).to have_text('Indonesia - Census of Agriculture 2003')
  end

  it 'sorts by relevance' do
    visit '/catalog'
    fill_in 'q', with: 'river'
    click_button 'search'
    results = find_all('.index_title a').map(&:text)
    expect(results[0]).to eq 'Colombia River Stories Datasets Archive, 1994-2020'
    expect(results[1]).to eq 'Water Quality Model Outputs for an Urban River in Birmingham, 2013-2014'
    expect(results[2]).to eq 'Stakeholder Workshops on Floods and Droughts Adaptation in the Limpopo River Basin, 2021-2022'
    expect(results[3]).to eq 'Optimizing Water Resources Allocation Under Climate Change Scenarios: A Case of Great Ruaha River Subbasin, Tanzania, 2021'
    expect(results[4]).to eq 'Resilient Mangrove Systems: Questionnaires, Participatory GIS, and Focus Groups in Mangrove Socio-ecological Systems in the Red River Delta, Vietnam, 2018-2019'
  end
end
