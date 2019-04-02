class ClueSerializer < ActiveModel::Serializer
  attributes :id, :number, :direction, :content
  belongs_to :puzzle
end
