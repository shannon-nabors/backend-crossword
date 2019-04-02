class Clue < ApplicationRecord
  belongs_to :puzzle
  has_many :clue_cells
  has_many :cells, through: :clue_cells
end
