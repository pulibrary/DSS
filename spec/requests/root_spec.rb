# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DSS root route' do
  context 'when user visits the staging site' do
    before { host! 'dss-staging.princeton.edu' }

    it 'redirects to the staging drupal site' do
      get '/'
      expect(response).to redirect_to('https://library-staging.princeton.edu/dss')
    end
  end

  it 'redirects to the production drupal site' do
    get '/'
    expect(response).to redirect_to('https://library.princeton.edu/dss')
  end
end