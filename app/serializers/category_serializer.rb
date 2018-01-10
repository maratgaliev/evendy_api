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

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title
end
