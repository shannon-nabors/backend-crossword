class CreateCells < ActiveRecord::Migration[5.2]
  def change
    create_table :cells do |t|
      t.boolean :shaded
      t.integer :number
      t.string :letter
      t.integer :row
      t.integer :column
      t.references :puzzle, foreign_key: true

      t.timestamps
    end
  end
end
