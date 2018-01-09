class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  scope :ordered, -> { order(updated_at: :desc) }
  has_many :events, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :visits, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  def remember_me
    true
  end
end
