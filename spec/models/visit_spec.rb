# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  user_id    :integer
#  choice     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment    :text
#  author_id  :integer
#

require 'rails_helper'

RSpec.describe Visit, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
