class CreateSolves < ActiveRecord::Migration[5.2]
  def change
    create_table :solves do |t|
      t.references :puzzle, foreign_key: true
      t.integer :solver_id
      t.integer :time

      t.timestamps
    end
  end
end
