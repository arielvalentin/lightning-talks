class CreateDirectMessageReplyCommand
  def process(direct_message_reply)
    message = Message.new(text: direct_message_reply.body,
                          sender: direct_message_reply.user,
                          recipients: direct_message_reply.recipients,
                          message_thread_id: direct_message_reply.message_thread.id )
    message.save!
  end
end
