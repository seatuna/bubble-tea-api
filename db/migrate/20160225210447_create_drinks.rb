class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name, null: false
      t.string :ingredients, null: false
      t.string :toppings
      t.text :notes

      t.timestamps null: false
    end
  end
end
