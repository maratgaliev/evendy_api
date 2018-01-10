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

class Visit < ApplicationRecord
  belongs_to :event
  belongs_to :user
end
