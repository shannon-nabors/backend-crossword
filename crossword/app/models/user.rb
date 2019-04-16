class User < ApplicationRecord
  has_many :puzzles, foreign_key: "constructor_id"
  has_many :solves, foreign_key: "solver_id"

  def name
    return self.first_name + " " + self.last_name
  end

  def all_solves
    return Solve.all.select{ |s| s.solver_id == self.id }
  end

  def all_puzzles
    return Puzzle.all.select{ |p| p.constructor_id == self.id }
  end

end
