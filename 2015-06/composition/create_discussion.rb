class CreateDiscussionCommand
  def initialize(authorization_policy, event_tracker, event_generator)
    @authorization_policy = authorization_policy
    @event_tracker = event_tracker
    @event_generator = event_generator
  end

  def process(discussion_request)
    group = Group.find(discussion_request.group_id)
    discussion = group.topics.find(discussion_request.topic_id).
      discussions.new(
        user: discussion_request.user,
        subject: discussion_request.subject,
        message: discussion_request.message
    )

      if @authorization_policy.is_satisfied_by?(discussion)
        discussion.save!
        @event_tracker.track_event(@event_generator.new_event(discussion_request))
      end
  end
end
