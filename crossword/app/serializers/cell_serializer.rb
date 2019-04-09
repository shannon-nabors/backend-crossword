require 'byebug'
class CellSerializer < ActiveModel::Serializer
  attributes :id, :shaded, :number, :letter, :row, :column
  belongs_to :puzzle



end
