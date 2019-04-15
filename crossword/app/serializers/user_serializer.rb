class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :username
end
