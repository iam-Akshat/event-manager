module UserHelper
  def previous_events
    @user.attended_events.filter do |e|
      e.date_of_event < Date.current
    end
  end

  def upcoming_events
    @user.attended_events.filter do |e|
      e.date_of_event > Date.current
    end
  end
end
