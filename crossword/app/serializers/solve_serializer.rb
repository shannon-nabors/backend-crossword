class SolveSerializer < ActiveModel::Serializer
  attributes :id, :solver_id, :puzzle_id, :created_at, :time
  belongs_to :solver
end
