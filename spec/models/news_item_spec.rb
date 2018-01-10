# == Schema Information
#
# Table name: news_items
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
