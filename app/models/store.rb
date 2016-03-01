class Store < ActiveRecord::Base
  has_many :drinks, inverse_of: :store
  belongs_to :user, inverse_of: :stores
end
