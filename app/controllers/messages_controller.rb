class MessagesController < ApplicationController

  def index
    @public_messages = Message.public
    @private_messages = current_user.messages.personal
    @message = Message.new
    @badges = Badge.all
  end

  def new
    @message = Message.new
    @badges = Badge.all
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
    users = User.search params[:term]
    respond_to do |format|
      format.json {
        render :json => {
          :users => users
        }
      }
    end
  end

  private
  def strong_params
    params.require(:message).permit(:title, :body, :user_id, :from_id, :share, :badge_id)
  end
end