class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :title, :correct_letters, :across_clues, :down_clues
  belongs_to :constructor
  has_many :cells
  # has_one :solved_puzzles, serializer: SolvedPuzzlesSerializer
  # has_one :unsolved_puzzles, serializer: UnsolvedPuzzlesSerializer
  # has_one :user_puzzles, serializer: UserPuzzlesSerializer

end
