class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :phone, :name, :avatar
  def avatar
    object.avatar.url(:avatar_main_image)
  end
end
