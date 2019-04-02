class CreateClueCells < ActiveRecord::Migration[5.2]
  def change
    create_table :clue_cells do |t|
      t.references :cell, foreign_key: true
      t.references :clue, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
