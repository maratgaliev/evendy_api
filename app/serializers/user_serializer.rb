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
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :name, :avatar
  def avatar
    object.avatar.url(:avatar_main_image)
  end
end
