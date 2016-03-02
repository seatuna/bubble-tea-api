# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'seatuna@water.com', password: 'fishy', admin: true)
User.create!(email: 'seatuna@gmail.com', password: 'fishy', admin: true)
User.create!(email: 'seatuna@yahoo.com', password: 'fishy', admin: true)

Store.transaction do
  CSV.foreach(Rails.root + 'data/stores.csv',
              headers: true) do |store_row|
    store = store_row.to_hash
    next if Store.exists? store
    Store.create!(store)
  end
end

Drink.transaction do
  CSV.foreach(Rails.root + 'data/drinks.csv',
              headers: true) do |drink_row|
    drink = drink_row.to_hash
    next if Drink.exists? drink
    Drink.create!(drink)
  end
end
