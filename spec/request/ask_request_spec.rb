# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Asks', type: :request do
  let!(:usuario) { create(:user) }
  let!(:segundo_usuario) { create(:user) }
  let!(:car) { create(:car, user_id: user.id) }
  let!(:solicitud) { create(:ask) }
  let!(:segunda_solicitud) { create(:ask) }

  before(:each) do
    sign_in segundo_usuario
  end

  describe 'create solicitud' do
    it 'should create a new solicitud' do
      expect do
        post "cars/#{car.id}/asks/new"
      end.to change(Ask, :count).by(1)
    end
  end

  describe 'aceptar solicitud' do
    it 'should aceptar a solicitud' do
      sign_in solicitud.turno.usuario
      post "/asks/#{solicitud.id}"
      expect(Ask.find(solicitud.id).descripcion).to eq('Aceptada')
    end
  end
end
