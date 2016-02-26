class Drink < ActiveRecord::Base
  belongs_to :store, inverse_of: :drinks
end
