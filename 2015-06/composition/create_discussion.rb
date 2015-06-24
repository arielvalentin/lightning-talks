class CreateDiscussionCommand
  def initialize(authorization_policy, discussion_factory, event_tracker)
    @authorization_policy = authorization_policy
    @discussion_factory = discussion_factory
    @event_tracker = event_tracker
  end

  def process(discussion_request)
    discussion = @discussion_factory.build_from(discussion_request)
    if @authorization_policy.is_satisfied_by?(discussion)
      discussion.save!
      @event_tracker.new_event(discussion)
    end
  end
end
