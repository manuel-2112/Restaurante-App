# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @review_params = params.require(:review).permit(:contenido, :calificacion)
    @review = Review.create(@review_params)
    @review.user_id = current_user.id
    @review.car = @car
    if @review.save
      redirect_to car_path(@car.id), notice: 'Gracias por agregar una reseña'
    else
      redirect_to car_path(@car.id), notice: 'No se ha podido agregar la reseña'
    end
  end
end
