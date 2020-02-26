class AddCircledToCells < ActiveRecord::Migration[5.2]
  def change
    add_column :cells, :circled, :boolean
  end
end
