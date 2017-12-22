class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :phone
end
