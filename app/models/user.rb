# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  nickname               :string
#  name                   :string
#  sex                    :string
#  avatar                 :string
#  kilometers             :integer
#  phone                  :string
#  is_admin               :boolean          default(FALSE)
#  visits_count           :integer
#  telegram               :string
#  vk                     :string
#  facebook               :string
#  twitter                :string
#  my_telegram            :string
#  bank_payment_page      :string
#  accept_rights          :boolean          default(TRUE)
#  is_banned              :boolean          default(FALSE)
#  pace                   :integer          default(0)
#  shooting               :integer          default(0)
#  passing                :integer          default(0)
#  dribbling              :integer          default(0)
#  defending              :integer          default(0)
#  physicality            :integer          default(0)
#  position_cd            :integer
#  cached_rating          :integer
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  scope :ordered, -> { order(updated_at: :desc) }
  scope :rated, -> { order(cached_rating: :desc) }
  has_many :events, foreign_key: :author_id, dependent: :destroy, inverse_of: :author
  has_many :visits, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  acts_as_taggable_on :labels
  as_enum :position, %i{forward goalkeeper midfielder defender universal}

  def rating
    [pace, shooting, passing, dribbling, defending, physicality].sum  / 6
  end

  def remember_me
    true
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
