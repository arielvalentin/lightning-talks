class CreateDiscussion < Base
  def process(topic_id, group_id)
    group_id = Group.find(group_id)
    topic_id = Topic.find(topic_id)
    discussion = Discussion.new(user: user,
                                subject: email.subject,
                                message: email_content)

    if Ability.new(user).can?(:create, discussion)
      discussion.save!
      track_event('discussion_created', discussion)
    end
  end
end
