class AllocationService
  def initialize(event, user)
    @event = event
    @user = user
  end

  def empty_slots?
    @event.visits.size != @event.max_limit
  end

  def going_users
    User.where('id in (?)', @event.visits.pluck(:user_id))
  end

  def percentage
    ((@event.visits.size * 100) / @event.max_limit) rescue 0
  end

  def user_decision?
    going_users.pluck(:id).include?(@user.id) rescue false
  end
end
