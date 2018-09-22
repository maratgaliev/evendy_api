# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  title             :string
#  description       :text
#  max_limit         :integer
#  author_id         :integer
#  start_at          :datetime
#  end_at            :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  short_description :string
#  address           :string
#  latitude          :float
#  longitude         :float
#  preview_image     :string
#  background_image  :string
#  map_file          :string
#  category_id       :integer
#  coupon_code       :string
#  is_private        :boolean          default(FALSE)
#  slug              :string
#  telegram          :string
#  price             :decimal(, )
#  author_name       :string
#

class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_at, :end_at, :author_name, :price, :short_description, :max_limit, :address, :latitude, :longitude, :author_id, :author_name, :telegram, :slug_url, :date_string, :percentage, :visits_count, :users, :decision

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
