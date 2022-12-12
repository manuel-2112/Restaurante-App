# frozen_string_literal: true

require 'rails_helper'

describe Users::RegistrationsController do
  describe 'Post#create' do
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:usuario]
    end

    it 'creates a new user' do
      expect do
        post :create, params: { user: attributes_for(:user) }
      end.to change(User, :count).by(1)
    end
  end

  describe 'Patch #UPDATE' do
    before :each do
      request.env['devise.mapping'] = Devise.mappings[:usuario]
      @usuario = create(:user)
      @old_email = @usuario.email
      sign_in @usuario
    end
    context 'valid attributes' do
      it 'updates user attributes' do
        patch :update, params: { id: @usuario.id, user: { email: 'example@gmail.com', current_password: 'password' } }
        expect(@usuario.reload.email).not_to eq(@old_email)
      end
    end
  end
end
