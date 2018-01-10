# == Schema Information
#
# Table name: categories
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :text
#  parent_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  is_active      :boolean          default(TRUE)
#  events_count   :integer
#  category_image :string
#

class Category < ApplicationRecord
  scope :ordered, -> { order(updated_at: :desc) }
end
