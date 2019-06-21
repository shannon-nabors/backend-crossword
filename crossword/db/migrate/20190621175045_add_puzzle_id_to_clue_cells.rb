class AddPuzzleIdToClueCells < ActiveRecord::Migration[5.2]
  def change
    add_column :clue_cells, :puzzle_id, :integer
  end
end
