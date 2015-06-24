class Base < Struct.new(:user, :email);
  private

  def track_event(event_name, *args)
    Analytics::Tracker.track_event(event_name, user, *args, source: 'email')
  end

  def email_content
    email.raw_html.presence || email.raw_body
  end

end
