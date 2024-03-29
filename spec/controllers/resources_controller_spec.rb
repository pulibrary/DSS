# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ResourcesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Resource. As you add validations to Resource, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { name: 'MyString',
      resource_id: 1,
      url: 'MyString',
      blurb: 'MyText',
      sample: 'MyString',
      principal_investigator: 'MyString',
      producer: 'MyString',
      distributor: 'MyString',
      version: 'MyString',
      more_detail_url: 'MyString',
      resource_type: 'MyString' }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ResourcesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, role: 'admin') }

  describe 'GET #index' do
    it 'assigns all resources as @resources' do
      resource = Resource.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:resources)).to include(resource)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested resource as @resource' do
      resource = Resource.create! valid_attributes
      get :show, params: { id: resource.to_param }, session: valid_session
      expect(assigns(:resource)).to eq(resource)
    end
  end

  describe 'GET #new' do
    it 'assigns a new resource as @resource' do
      sign_in admin
      get :new, params: {}, session: valid_session
      expect(assigns(:resource)).to be_a_new(Resource)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested resource as @resource' do
      sign_in admin
      resource = Resource.create! valid_attributes
      get :edit, params: { id: resource.to_param }, session: valid_session
      expect(assigns(:resource)).to eq(resource)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      context 'when not logged in' do
        it 'does not create a new Resource' do
          expect do
            post :create, params: { resource: valid_attributes }, session: valid_session
          end.not_to change(Resource, :count)
        end
      end

      context 'when logged in as non-admin user' do
        before do
          sign_in user
        end

        it 'does not create a new Resource' do
          expect do
            post :create, params: { resource: valid_attributes }, session: valid_session
          end.not_to change(Resource, :count)
        end
      end

      context 'when logged in as admin user' do
        before do
          sign_in admin
        end

        it 'creates a new Resource' do
          expect do
            post :create, params: { resource: valid_attributes }, session: valid_session
          end.to change(Resource, :count).by(1)
        end

        it 'assigns a newly created resource as @resource' do
          post :create, params: { resource: valid_attributes }, session: valid_session
          expect(assigns(:resource)).to be_a(Resource)
          expect(assigns(:resource)).to be_persisted
        end

        it 'redirects to the created resource' do
          post :create, params: { resource: valid_attributes }, session: valid_session
          expect(response).to redirect_to(Resource.last)
        end
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved resource as @resource' do
        post :create, params: { resource: invalid_attributes }, session: valid_session
        expect(assigns(:resource)).to be_a_new(Resource)
      end

      it "re-renders the 'new' template" do
        post :create, params: { resource: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { name: 'New name' }
      end

      context 'when not logged in' do
        it 'does not modify the requested Resource' do
          resource = Resource.create! valid_attributes
          expect do
            put :update, params: { id: resource.id, resource: new_attributes }, session: valid_session
            resource.reload
          end.not_to(change { Resource.find(resource.id) })
          expect(resource.name).to eq('MyString')
        end
      end

      context 'when logged in as a non-admin user' do
        before do
          sign_in user
        end

        it 'does not modify the requested Resource' do
          resource = Resource.create! valid_attributes
          expect do
            put :update, params: { id: resource.id, resource: new_attributes }, session: valid_session
            resource.reload
          end.not_to(change { Resource.find(resource.id) })
          expect(resource.name).to eq('MyString')
        end
      end

      context 'when logged in as admin user' do
        before do
          sign_in admin
        end

        it 'updates the requested resource' do
          resource = Resource.create! valid_attributes
          put :update, params: { id: resource.to_param, resource: new_attributes }, session: valid_session
          resource.reload
          expect(resource.name).to eq('New name')
        end

        it 'assigns the requested resource as @resource' do
          resource = Resource.create! valid_attributes
          put :update, params: { id: resource.to_param, resource: valid_attributes }, session: valid_session
          expect(assigns(:resource)).to eq(resource)
        end

        it 'redirects to the resource' do
          resource = Resource.create! valid_attributes
          put :update, params: { id: resource.to_param, resource: valid_attributes }, session: valid_session
          expect(response).to redirect_to(resource)
        end
      end
    end

    context 'with invalid params' do
      it 'assigns the resource as @resource' do
        resource = Resource.create! valid_attributes
        put :update, params: { id: resource.to_param, resource: invalid_attributes }, session: valid_session
        expect(assigns(:resource)).to eq(resource)
      end

      it "re-renders the 'edit' template" do
        resource = Resource.create! valid_attributes
        put :update, params: { id: resource.to_param, resource: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when not logged in' do
      it 'does not delete anything' do
        resource = Resource.create! valid_attributes
        expect do
          delete :destroy, params: { id: resource.to_param }, session: valid_session
        end.not_to change(Resource, :count)
      end
    end

    context 'when logged in as non-admin user' do
      before do
        sign_in user
      end

      it 'does not delete anything' do
        resource = Resource.create! valid_attributes
        expect do
          delete :destroy, params: { id: resource.to_param }, session: valid_session
        end.not_to change(Resource, :count)
      end
    end

    context 'when logged in as admin user' do
      before do
        sign_in admin
      end

      it 'destroys the requested resource' do
        resource = Resource.create! valid_attributes
        expect do
          delete :destroy, params: { id: resource.to_param }, session: valid_session
        end.to change(Resource, :count).by(-1)
      end

      it 'redirects to the resources list' do
        resource = Resource.create! valid_attributes
        delete :destroy, params: { id: resource.to_param }, session: valid_session
        expect(response).to redirect_to(resources_url)
      end
    end
  end
end
