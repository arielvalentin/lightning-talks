class CreateDirectMessageReply < Base
  def process(message_thread)
    message = Message.new(text: email.body,
                          sender: user,
                          recipients: message_recipients(message_thread),
                          message_thread_id: message_thread.id )
    message.save!
  end

  private

  def message_recipients(message_thread)
    message_thread.participants - [user]
  end
end
