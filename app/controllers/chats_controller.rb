class ChatsController < ApplicationController
  def index
  	@chat = Chat.where(group_id: current_user2.group_lists.map(&:group_id).uniq )
  	render	json:{ chat: @chat}
    #return render :json => @chat.to_json(:include => :message )
  end
  def show
    @chat = Chat.includes(:messages).find(params[:id])
    return render :json => @chat.to_json(:include => :messages, root: true )
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
