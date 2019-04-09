class Cell < ApplicationRecord
  belongs_to :puzzle
  has_many :clue_cells, dependent: :destroy
  has_many :clues, through: :clue_cells

  def fellows(dir)
      clue = self.clues.select{ |c| c.direction == dir }[0]
      cells = self.puzzle.cells.select{ |c| c.clues.include?(clue) && c != self}
      return cells.map(&:id)
  end

  def fellow_across
    return fellows("across")
  end

  def fellow_down
    return fellows("down")
  end

end
