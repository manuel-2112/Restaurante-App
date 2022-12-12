# frozen_string_literal: true

class AsksController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
  end

  def create
    @car = Car.find(params[:car_id])
    @asks_params = params.require(:ask).permit(:name, :mail, :dates, :reason)
    @ask = Ask.create(@asks_params)
    @ask.user_id = current_user.id
    @ask.car_id = @car.id
    @ask.id_dueño = @car.user_id
    @ask.estado = 'PENDIENTE'
    if @ask.save
      redirect_to asks_creadas_path, notice: 'Se ha creado la solicitud correctamente'
    else
      redirect_to main_home_path, notice: 'Error al crear solicitud'
    end
  end

  def show
    @ask = Ask.find(params[:id])
  end

  def recibidas
    @owner_cars = user_signed_in? ? Car.where(user_id: current_user.id).all : []
    @cars_ids = []
    @owner_cars.each do |car|
      @cars_ids << car.id
    end
    @owner_asks = Ask.where(car_id: @cars_ids).all
  end

  def creadas
    @user_asks = Ask.where(user_id: current_user.id)
  end

  def edit
    @ask = Ask.find(params[:id])
  end

  def update
    @ask = Ask.find(params[:id])
    @asks_new_params = params.require(:ask).permit(:name, :mail, :dates, :reason)

    if @ask.update(@asks_new_params)
      redirect_to asks_creadas_path, notice: 'Se ha actualizado la información de la solicitud'
    else
      redirect_to asks_creadas_path, notice: 'Error al actualizar la información de la solicitud'
    end
  end

  def delete
    @ask = Ask.find(params[:id])
    @ask.delete
    redirect_to asks_recibidas_path, notice: 'Se ha eliminado la solicitud'
  end

  def aceptado
    @ask = Ask.find(params[:id])
    @ask.estado = 'ACEPTADO'
    current_user.asks << @ask
    redirect_to asks_recibidas_path, notice: 'Se ha aceptado la solicitud'
  end

  def rechazado
    @ask = Ask.find(params[:id])
    @ask.estado = 'RECHAZADO'
    current_user.asks << @ask
    redirect_to asks_recibidas_path, notice: 'Se ha rechazado la solicitud'
  end
end
