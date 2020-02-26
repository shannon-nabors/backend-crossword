require 'byebug'
class CellSerializer < ActiveModel::Serializer
  attributes :id, :circled, :shaded, :number, :letter, :row, :column, :clues
  belongs_to :puzzle
  has_many :clues, through: :clue_cells
end
