class ConstructorSerializer < ActiveModel::Serializer
  type :user
  
  attributes :id, :name, :email, :username, :password
  has_many :puzzles
end
