class ClueCellSerializer < ActiveModel::Serializer
  attributes :id, :cell_id, :clue_id, :position, :puzzle_id
end
