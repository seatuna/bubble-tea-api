class AddStoreRefToDrinks < ActiveRecord::Migration
  def change
    add_reference :drinks, :store, index: true, foreign_key: true
  end
end
