class MessagesController < ApplicationController
  skip_before_filter :authenticate_user_from_token!
	skip_before_filter :authenticate_user2!

  def create
    @message = Message.new(create_message_params)
    if @message.save
      return render json: {message: @message}
    end
  end

  def index
    @messages = Message.where(chat_id: params.require(:chat_id))
    return render json: {messages: @messages}
  end

  private

  def create_message_params
    params.require(:message).permit(:chat_member_id, :chat_id, :text)
  end
end
