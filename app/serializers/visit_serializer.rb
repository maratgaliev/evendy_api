class VisitSerializer < ActiveModel::Serializer
  attributes :id, :event_id, :user_id, :choice, :created_at, :updated_at, :comment, :author_id
end
