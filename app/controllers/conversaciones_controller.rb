class ConversacionesController < ApplicationController
    def index
        @conversaciones = current_user.mailbox.conversations
    end

    def show
        @conversacion = current_user.mailbox.conversations.find(params[:id])
    end

    def new
        @usuarios = User.all - [current_user]
    end

    def create
        usuario = User.find(params[:user_id])
        enviar = current_user.send_message(usuario, params[:body], params[:subject])
        redirect_to conversacione_path(enviar.conversation)
    end

end
