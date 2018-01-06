class StatResult
  include ActiveModel::Serialization
  attr_reader :user_count, :event_count, :last_user_name, :last_event_name

  def initialize(user_count, event_count, last_user_name, last_event_name)
    @user_count = user_count
    @event_count = event_count
    @last_user_name = last_user_name
    @last_event_name = last_event_name
  end
end