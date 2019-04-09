require 'byebug'
class CellSerializer < ActiveModel::Serializer
  attributes :id, :shaded, :number, :letter, :row, :column#, :fellow_across, :fellow_down
  belongs_to :puzzle

  # def fellows(dir)
  #     clue = object.clues.select{ |c| c.direction == dir }[0]
  #     cells = object.puzzle.cells.select{ |c| c.clues.include?(clue) && c != object}
  #     return cells.map(&:id)
  # end
  #
  # def fellow_across
  #   return fellows("across")
  # end
  #
  # def fellow_down
  #   return fellows("down")
  # end

end
