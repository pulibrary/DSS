# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'DSS root route' do
  it 'redirects to the DSS home page' do
    get '/'
    expect(response).to redirect_to('https://library.princeton.edu/services/data-and-statistical-services')
  end
end
