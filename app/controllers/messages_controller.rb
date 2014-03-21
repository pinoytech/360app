class MessagesController < ApplicationController

  def index
    @public_messages = Message.public
    @private_messages = current_user.messages.personal
    @message = Message.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(strong_params)
    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def search_users
    user = User.search params[:term]
    render json: { data: user }
  end

  private
  def strong_params
    params.require(:message).permit(:title, :body, :user_id, :from_id, :share)
  end
end