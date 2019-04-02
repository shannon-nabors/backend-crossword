class CreateClues < ActiveRecord::Migration[5.2]
  def change
    create_table :clues do |t|
      t.integer :number
      t.string :direction
      t.text :content
      t.references :puzzle, foreign_key: true

      t.timestamps
    end
  end
end
