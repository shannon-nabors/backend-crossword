class Cell < ApplicationRecord
  belongs_to :puzzle
  has_many :clue_cells
  has_many :clues, through: :clue_cells
end
