class ChatsController < ApplicationController
  def index
  	@chat = Chat.all
  	render	json:{ chat: chat}
  end
  def show
    @chat = Chat.find(params[:id])
    return render json: {chat: @chat}
  	rescue ActiveRecord::RecordNotFound => e
    return render json: {errors: ['Not found']}, status: 404
  end

  def create 
  	c = Chat.new(chat_params)
  	c.save
  	render json: {chat: c}
  end

  def delete 
  	c_id = params[:id].to_i
  	@chat = Chat.where(id: c_id).first	
	@chat.destroy	
	render json: {chat: notes}
  end

  def chat_params
  	if @chat_params.present?
		@chat_params
	else
		@chat_params = params.require(:chat).permit(:group)
	end
  end
end
