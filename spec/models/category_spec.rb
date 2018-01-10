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

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
