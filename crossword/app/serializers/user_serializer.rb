class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :name, :username, :image, :bio, :all_solves, :all_puzzles
end
