module MessagesHelper
  def privacy_text(message)
    message.share? ? 'This message is visible to all' : "This message is visible only to you and #{message.from.first_name}"
  end
end
