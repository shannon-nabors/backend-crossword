class Puzzle < ApplicationRecord
  belongs_to :constructor, class_name: "User"
  has_many :solves
  has_many :solvers, through: :solves, class_name: "User"
  has_many :cells, dependent: :destroy
  has_many :clues, dependent: :destroy

  def correct_letters
    letters = {}
    self.cells.each do |c|
      if c.letter
        letters[c.id] = c.letter
      end
    end
    letters
  end

  def across_clues
    return self.clues.select{ |c| c.direction == "across"}
  end

  def down_clues
    return self.clues.select{ |c| c.direction == "down"}
  end

end
