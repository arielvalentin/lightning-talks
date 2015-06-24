class CreateReply < Base
  def process(discussion)
    Reply.new(user: user, parent: discussion, message: email.body )

    if Ability.new(user).can?(:create, reply)
      reply.save
      track_event('reply_created', reply)
    end
  end
end
