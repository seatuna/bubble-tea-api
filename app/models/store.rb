class Store < ActiveRecord::Base
  has_many :drinks, inverse_of: :store
end
