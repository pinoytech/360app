module MessagesHelper
  def privacy_text(message)
    message.share? ? 'This message is visible to all.' : "This message is visible only to you and #{message.sender.first_name}."
  end
end
