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

RSpec.describe DataFilesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # DataFile. As you add validations to DataFile, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    { legacy_id: 2,
      files: 'Files',
      size: 'Size',
      comp_size: 100,
      line_count: 'Line Count',
      line_length: 'Line Length',
      part: 'Part',
      file_type_a: 'File Type A',
      file_type_b: 'File Type B',
      flag_one: 'Flag One',
      flag_two: 'Flag Two',
      file_type_tech: 'File Type Tech',
      note: 'Note',
      study_num: 3,
      permission: 'Permission',
      study_id: 4 }
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DataFilesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:user, role: 'admin') }

  describe 'GET #index' do
    it 'assigns all data_files as @data_files' do
      data_file = DataFile.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:data_files)).to eq([data_file])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested data_file as @data_file' do
      data_file = DataFile.create! valid_attributes
      get :show, params: { id: data_file.to_param }, session: valid_session
      expect(assigns(:data_file)).to eq(data_file)
    end
  end

  describe 'GET #new' do
    it 'assigns a new data_file as @data_file' do
      sign_in admin
      get :new, params: {}, session: valid_session
      expect(assigns(:data_file)).to be_a_new(DataFile)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested data_file as @data_file' do
      sign_in admin
      data_file = DataFile.create! valid_attributes
      get :edit, params: { id: data_file.to_param }, session: valid_session
      expect(assigns(:data_file)).to eq(data_file)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      context 'when not logged in' do
        it 'does not create a new DataFile' do
          expect do
            post :create, params: { data_file: valid_attributes }, session: valid_session
          end.not_to change(DataFile, :count)
        end
      end

      context 'when logged in as non-admin user' do
        before do
          sign_in user
        end

        it 'does not create a new DataFile' do
          expect do
            post :create, params: { data_file: valid_attributes }, session: valid_session
          end.not_to change(DataFile, :count)
        end
      end

      context 'when logged in as admin user' do
        before do
          sign_in admin
        end

        it 'creates a new DataFile' do
          expect do
            post :create, params: { data_file: valid_attributes }, session: valid_session
          end.to change(DataFile, :count).by(1)
        end

        it 'assigns a newly created data_file as @data_file' do
          post :create, params: { data_file: valid_attributes }, session: valid_session
          expect(assigns(:data_file)).to be_a(DataFile)
          expect(assigns(:data_file)).to be_persisted
        end

        it 'redirects to the created data_file' do
          post :create, params: { data_file: valid_attributes }, session: valid_session
          expect(response).to redirect_to(DataFile.last)
        end
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved data_file as @data_file' do
        post :create, params: { data_file: invalid_attributes }, session: valid_session
        expect(assigns(:data_file)).to be_a_new(DataFile)
      end

      it "re-renders the 'new' template" do
        post :create, params: { data_file: invalid_attributes }, session: valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        { note: 'A new note' }
      end

      context 'when not logged in' do
        it 'does not modify the requested DataFile' do
          data_file = DataFile.create! valid_attributes
          expect do
            put :update, params: { id: data_file.id, data_file: new_attributes }, session: valid_session
            data_file.reload
          end.not_to(change { DataFile.find(data_file.id) })
          expect(data_file.note).to eq('Note')
        end
      end

      context 'when logged in as a non-admin user' do
        before do
          sign_in user
        end

        it 'does not modify the requested data file' do
          data_file = DataFile.create! valid_attributes
          expect do
            put :update, params: { id: data_file.id, data_file: new_attributes }, session: valid_session
            data_file.reload
          end.not_to(change { DataFile.find(data_file.id) })
          expect(data_file.note).to eq('Note')
        end
      end

      context 'when logged in as admin user' do
        before do
          sign_in admin
        end

        it 'updates the requested data_file' do
          data_file = DataFile.create! valid_attributes
          put :update, params: { id: data_file.to_param, data_file: new_attributes }, session: valid_session
          data_file.reload
          expect(data_file.note).to eq('A new note')
        end

        it 'assigns the requested data_file as @data_file' do
          data_file = DataFile.create! valid_attributes
          put :update, params: { id: data_file.to_param, data_file: valid_attributes }, session: valid_session
          expect(assigns(:data_file)).to eq(data_file)
        end

        it 'redirects to the data_file' do
          data_file = DataFile.create! valid_attributes
          put :update, params: { id: data_file.to_param, data_file: valid_attributes }, session: valid_session
          expect(response).to redirect_to(data_file)
        end
      end
    end

    context 'with invalid params' do
      it 'assigns the data_file as @data_file' do
        data_file = DataFile.create! valid_attributes
        put :update, params: { id: data_file.to_param, data_file: invalid_attributes }, session: valid_session
        expect(assigns(:data_file)).to eq(data_file)
      end

      it "re-renders the 'edit' template" do
        data_file = DataFile.create! valid_attributes
        put :update, params: { id: data_file.to_param, data_file: invalid_attributes }, session: valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when not logged in' do
      it 'does not delete anything' do
        data_file = DataFile.create! valid_attributes
        expect do
          delete :destroy, params: { id: data_file.to_param }, session: valid_session
        end.not_to change(DataFile, :count)
      end
    end

    context 'when logged in as non-admin user' do
      before do
        sign_in user
      end

      it 'does not delete anything' do
        data_file = DataFile.create! valid_attributes
        expect do
          delete :destroy, params: { id: data_file.to_param }, session: valid_session
        end.not_to change(DataFile, :count)
      end

      context 'when logged in as admin user' do
        before do
          sign_in admin
        end

        it 'destroys the requested data_file' do
          data_file = DataFile.create! valid_attributes
          expect do
            delete :destroy, params: { id: data_file.to_param }, session: valid_session
          end.to change(DataFile, :count).by(-1)
        end

        it 'redirects to the data_files list' do
          data_file = DataFile.create! valid_attributes
          delete :destroy, params: { id: data_file.to_param }, session: valid_session
          expect(response).to redirect_to(data_files_url)
        end
      end
    end
  end
end
