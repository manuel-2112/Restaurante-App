# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Review', type: :request do
    let(:user) { create(:user) }
    let(:car) { create(:user) }
  
    before(:each) do
      @review = Review.new(user_id: user.id, car_id: car.id, calificacion: rand(1...5), contenido: Faker::Lorem.sentence)
    end

  describe 'get reviews' do
    it 'should return reviews' do
      sign_in user
      get "cars/#{car.id}/reviews"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'create reviews' do
    it 'request with valid params should create a new review' do
      sign_in user
      expect do
        get "cars/#{car.id}/reviews/new", params: {
          contenido: Faker::Lorem.sentence,
          calificacion: rand(1..5)
        }
      end.to change(Review, :count).by(1)
    end

    it 'request with no calificion should not create a new review' do
        sign_in user
      expect do
        post "cars/#{car.id}/reviews/new", params: {
          contenido: Faker::Lorem.sentence
        }
      end.to change(Review, :count).by(0)
    end

    it 'request with out of range calificion should not create a new review' do
      sign_in user
      expect do
        post "cars/#{car.id}/reviews/new", params: {
          contenido: Faker::Lorem.sentence,
          calificacion: rand(6..30)
        }
      end.to change(Review, :count).by(0)
    end

    it 'request with no contenido should not create a new review' do
      sign_in user
      expect do
        post "cars/#{car.id}/reviews/new", params: {
          calificacion: rand(1..5)
        }
      end.to change(Review, :count).by(0)
    end

    it 'request with no user logged in should not create a new review' do
      expect do
        post "cars/#{car.id}/reviews/new", params: {
          contenido: Faker::Lorem.sentence,
          calificacion: rand(1..5)
        }
      end.to change(Review, :count).by(0)
    end
  end

  describe 'update reviews' do
    it 'should return form if author tries to edit' do
      sign_in user
      get "cars/#{car.id}/reviews/#{@review.id}/edit"
      expect(response).to have_http_status(:ok)
    end

    it 'should update review if new calification is valid' do
      sign_in user
      new_calification = rand(1..5)
      patch "/reviews/#{@review.user.id}/#{@review.id}", params: {
        review: {
          calificacion: new_calification,
          contenido: @review.contenido
        }
      }
      expect(Review.find(@review.id).calificacion).to eq(new_calification)
    end

    it 'should update review if new contenido is valid' do
      sign_in user
      new_cont = Faker::Lorem.sentence
      patch "cars/#{car.id}/reviews/#{@review.id}", params: {
        review: {
          calificacion: @review.calificacion,
          contenido: new_cont
        }
      }
      expect(Review.find(@review.id).contenido).to eq(new_cont)
    end

    it 'should not update review if new contenido is not valid' do
      sign_in user
      new_cont = Faker::Lorem.sentence
      patch "cars/#{car.id}/reviews/#{@review.id}", params: {
        review: {
          calificacion: @review.calificacion,
          contenido: nil
        }
      }
      expect(Review.find(@review.id).contenido).to eq(@review.contenido)
    end

    it 'should not update review if new calificacion is not valid' do
      sign_in user
      patch "cars/#{car.id}/reviews/#{@review.id}", params: {
        review: {
          calificacion: rand(6..30),
          contenido: @review.contenido
        }
      }
      expect(Review.find(@review.id).calificacion).to eq(@review.calificacion)
    end
  end


  describe 'delete review' do
    it 'should delete a review' do
      sign_in user
      expect do
        delete "cars/#{car.id}/reviews/#{@review.id}"
      end.to change(Review, :count).by(-1)
    end
  end
end