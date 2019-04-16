class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :title, :correct_letters, :across_clues, :down_clues, :average_solve_time
  belongs_to :constructor
  has_many :cells
end
