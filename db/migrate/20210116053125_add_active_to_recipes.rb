class AddActiveToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :active, :boolean
  end
end
