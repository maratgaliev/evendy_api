# == Schema Information
#
# Table name: jwt_blacklists
#
#  id  :integer          not null, primary key
#  jti :string           not null
#  exp :datetime         not null
#

class JwtBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Blacklist
end
