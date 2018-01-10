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

require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
