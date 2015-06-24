class CreateReplyHandler
  def initialize(authorization_policy, event_tracker, event_generator)
    @authorization_policy = authorization_policy
    @event_tracker = event_tracker
    @event_generator = event_generator
  end

  def process(reply_request)
    Reply.new(user: reply_request.user,
              parent: reply_request.discussion,
              message: reply_request.message )

    if @authorization_policy.is_satisfied_by?(discussion)
      reply.save
      @event_tracker.track_event(@event_generator.new_event(discussion_request))
    end
  end
end
