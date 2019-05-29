class CreateRecipesTable < ActiveRecord::Migration
  def change
    create_table :recipes do |col|
      col.string :name
      col.string :ingredients
      col.string :cook_time
    end
  end
end
