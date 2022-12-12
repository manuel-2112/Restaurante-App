class MensajesController < ApplicationController
  before_action :set_conversation

  def create
    receipt = current_user.reply_to_conversation(@conversacion, params[:body])
    redirect_to conversacione_path(receipt.conversation)
  end
  
  private

    def set_conversation
      @conversacion = current_user.mailbox.conversations.find(params[:conversacione_id])
    end
end
