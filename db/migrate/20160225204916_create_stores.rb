class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name, null: false
      t.string :locations, null: false
      t.text :tips

      t.timestamps null: false
    end
  end
end
