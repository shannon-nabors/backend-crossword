class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :title, :correct_letters, :across_clues, :down_clues
  belongs_to :constructor
  has_many :cells

end
