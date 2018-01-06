class StatResultSerializer < ActiveModel::Serializer
  attributes :user_count, :event_count, :last_user_name, :last_event_name
end