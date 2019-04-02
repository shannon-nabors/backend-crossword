class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :constructor
  has_many :cells
  has_many :clues
end
