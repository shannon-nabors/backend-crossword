class PuzzleSerializer < ActiveModel::Serializer
  attributes :id, :title, :correct_letters, :across_clues, :down_clues
  belongs_to :constructor
  has_many :cells
  # has_many :clues

  def correct_letters
    letters = {}
    object.cells.each do |c|
      if c.letter
        letters[c.id] = c.letter
      end
    end
    letters
  end

  def across_clues
    return object.clues.select{ |c| c.direction == "across"}
  end

  def down_clues
    return object.clues.select{ |c| c.direction == "down"}
  end

end
