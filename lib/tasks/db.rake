namespace :db do
  desc "Load example data from db/examples.rb"
  task examples: :environment do
    require_relative '../../db/examples'
  end

  unless Rails.env == "production"
    desc "Drop and setup the development database with examples"
    task nuke_pave: %w(environment db:drop db:create db:migrate db:seed db:examples) do
      puts "Nuke and pave of #{Rails.env} complete."
    end
  end
end

require 'csv'

namespace :db do
  namespace :populate do
    desc 'Fill the database with example data'
    task all: [:stores, :drinks]

    desc 'Fill the stores table with example data'
    task stores: :environment do
      Store.transaction do
        CSV.foreach(Rails.root + 'data/stores.csv',
                    headers: true) do |store_row|
          store = store_row.to_hash
          next if Store.exists? store
          Store.create!(store)
        end
      end
    end

    desc 'Fill the drinks table with example data'
    task drinks: :environment do
      Drink.transaction do
        CSV.foreach(Rails.root + 'data/drinks.csv',
                    headers: true) do |drink_row|
          drink = drink_row.to_hash
          next if Drink.exists? drink
          Drink.create!(drink)
        end
      end
    end
  end
end
