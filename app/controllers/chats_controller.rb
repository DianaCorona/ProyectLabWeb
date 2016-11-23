class ChatsController < ApplicationController
  def show
    @chat = Chat.find(params[:id])
    return render json: {chat: @chat}
  rescue ActiveRecord::RecordNotFound => e
    return render json: {errors: ['Not found']}, status: 404
  end
end
