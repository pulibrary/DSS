# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController do
  before do
    request.env['devise.mapping'] = Devise.mappings[:user]
    controller.request.env['omniauth.auth'] = omniauth_response
  end

  describe 'logging in' do
    context 'with a valid cas login' do
      let(:omniauth_response) { OmniAuth::AuthHash.new(provider: 'cas', uid: 'someuid') }

      describe 'who is not already in the database' do
        it 'creates a user and gives a success flash response' do
          get :cas
          expect(response).to redirect_to(root_path)
          expect(flash.notice).to eq('Successfully authenticated from from Princeton Central Authentication Service account.')
        end
      end

      describe 'who is an admin in the database' do
        let(:user) { FactoryBot.create(:user, role: 'admin') }

        before do
          allow(User).to receive(:from_cas).and_return(user)
        end

        it 'redirects to root and gives success notice flash' do
          get :cas
          expect(response).to redirect_to(root_path)
          expect(flash.notice).to eq('Successfully authenticated from from Princeton Central Authentication Service account.')
        end
      end
    end
  end
end
