class CreateDiscussion < Base
  def process(topic_id, group_id)
    group = Group.find(group_id)
    discussion = group.topics.find(topic_id).
      discussions.new(
        user: user,
        subject: email.subject,
        message: email_content
    )

      if Ability.new(user).can?(:create, discussion)
        discussion.save!
        track_event('discussion_created', discussion)
      end
  end
end
