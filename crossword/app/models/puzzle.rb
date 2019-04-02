class Puzzle < ApplicationRecord
  belongs_to :constructor, class_name: "User"
  has_many :solves
  has_many :solvers, through: :solves, class_name: "User"
  has_many :cells
  has_many :clues
end
