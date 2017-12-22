class Event < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id, inverse_of: :events
  has_many :visits, dependent: :destroy

  scope :ordered, -> { order(updated_at: :desc) }
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
