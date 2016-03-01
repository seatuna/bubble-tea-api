class AddUserRefToDrinks < ActiveRecord::Migration
  def change
    add_reference :drinks, :user, index: true, foreign_key: true
  end
end
