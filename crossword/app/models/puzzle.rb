require 'byebug'
class Puzzle < ApplicationRecord
  belongs_to :constructor, class_name: "User"
  has_many :solves
  has_many :solvers, through: :solves, class_name: "User"
  has_many :cells, dependent: :destroy
  has_many :clues, dependent: :destroy
  has_many :favorites, dependent: :destroy

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
    clues = self.clues.select{ |c| c.direction == "across"}
    return clues.sort_by { |clue| clue.id }
  end

  def down_clues
    clues = self.clues.select{ |c| c.direction == "down"}
    return clues.sort_by { |clue| clue.id }
  end

  def average_solve_time
    total_time = 0
    total_solves = 0
    solves = Solve.all.select{ |s| s.puzzle_id === self.id }
    solves.each do |s|
      total_time = total_time + s.time
      total_solves += 1
    end
    if total_solves > 0
      return total_time/total_solves
    else
      return "N/A"
    end
  end

  def total_favs
    return self.favorites.length
  end

end
