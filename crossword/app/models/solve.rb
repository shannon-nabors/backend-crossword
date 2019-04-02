class Solve < ApplicationRecord
  belongs_to :solver, class_name: "User"
  belongs_to :puzzle
end
