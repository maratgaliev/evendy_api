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

class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, inverse_of: :events
  has_many :visits, dependent: :destroy

  scope :ordered, -> { order(start_at: :desc) }
  before_save :set_author_name
  geocoded_by :address
  reverse_geocoded_by :latitude, :longitude

  def to_param
    "#{id}-#{title.parameterize}"
  end

  private
  
  def set_author_name
    self.author_name = self&.author&.name
  end
end
