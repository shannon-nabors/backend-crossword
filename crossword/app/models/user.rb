class User < ApplicationRecord
  has_many :puzzles, foreign_key: "constructor_id"
  has_many :solves, foreign_key: "solver_id"

  def name
    return self.first_name + " " + self.last_name
  end

end
