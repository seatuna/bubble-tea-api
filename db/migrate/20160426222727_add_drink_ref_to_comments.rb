class AddDrinkRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :drink, index: true, foreign_key: true
  end
end
