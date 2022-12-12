class ComentariosController < ApplicationController

    def index
        @comentario = Comentario.all
      end
    
      def show
        @comentario = Comentario.find(params[:id])
      end
    
      def new
        @comentario = Comentario.new
      end
    
      def create
        @comentario_params = params.require(:car).permit(:marca, :modelo, :año, :precio, :dueño)
        @car = Car.create(@car_params)
        @car.user_id = current_user.id
        puts @car.user_id
        if @car.save
          redirect_to cars_path, notice: 'Se ha agregado el ingrediente a la base de datos'
        else
          redirect_to root_path, notice: 'Error al agregar el ingrediente'
        end
      end
    
      def edit
        @car = Car.find(params[:id])
      end
    
      def update
        @car = Car.find(params[:id])
        @new_car_params = params.require(:car).permit(:marca, :modelo, :año, :precio, :dueño)
    
        if @car.update(@new_car_params)
          redirect_to cars_path, notice: 'Se ha actualizado la información del ingrediente'
        else
          redirect_to cars_path, notice: 'Error al actualizar la información del ingrediente'
        end
      end
    
      def destroy
        @car = Car.find(params[:id])
        @car.delete
        redirect_to cars_path, notice: 'Se ha eliminado la publicación'
      end
end
