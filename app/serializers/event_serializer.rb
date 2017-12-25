class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at, :end_at, :author_name, :price, :short_description, :max_limit, :address, :latitude, :longitude, :author_id, :author_name, :slug_url, :date_string, :percentage, :visits_count, :users, :decision

  has_many :users
  def event
    EventDecorator.decorate(object)
  end

  def srv
    AllocationService.new(object, current_user)
  end

  def decision
    srv.user_decision?
  end

  def visits_count
    event.visits.size
  end

  def date_string
    event.date_string
  end

  def author_avatar_url
    object.author.avatar_url
  end

  def slug_url
    event.slug
  end

  def start_at
    event.rfc(:start_at)
  end

  def end_at
    event.rfc(:end_at)
  end

  def price
    event.format_price
  end

  def users
    srv.going_users
  end

  def percentage
    srv.percentage
  end
end
