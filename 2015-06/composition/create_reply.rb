class CreateReplyHandler
  def initialize(authorization_policy, reply_factory, event_tracker)
    @authorization_policy = authorization_policy
    @reply_factory = reply_factory
    @event_tracker = event_tracker
  end

  def process(reply_request)
    reply = @reply_factory.build_from(reply_request)
    if @authorization_policy.is_satisfied_by?(discussion)
      reply.save
      @event_tracker.new_event(reply)
    end
  end
end
