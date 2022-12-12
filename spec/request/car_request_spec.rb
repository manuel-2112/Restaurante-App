# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Cars', type: :request do
  let!(:car) { create(:car) }
  let!(:user) { create(:user) }

  before(:each) do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

  describe 'get index' do
    it 'should return a successful request' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'get Car' do
    it 'should return a successful request' do
      get "/cars/#{car.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'delete Car' do
    it 'should delete a Car' do
      sign_in turno.user
      expect do
        delete "/cars/#{car.id}"
      end.to change(Car, :count).by(-1)
    end
  end


  describe 'create Car' do
    it 'should create a new Car' do
      sign_in car.user
      expect do
        post '/cars/', params: {
          car: {
            marca: car.marca,
            modelo: car.modelo,
            año: car.año,
            precio: car.precio,
            dueño: car.dueño
          }
        }
      end.to change(Car, :count).by(1)
    end
  end

  describe 'update Car' do
    it 'should update a Car' do
      sign_in car.user
      car.marca = 'Toyota'
      patch "/cars/#{cars.id}", params: {
        car: {
            marca: car.marca,
            modelo: car.modelo,
            año: car.año,
            precio: car.precio,
            dueño: car.dueño
          }
      }
      expect(Car.find(car.id).marca).to eq('Toyota')
    end
  end
end