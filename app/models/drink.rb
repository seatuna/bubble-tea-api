class Drink < ActiveRecord::Base
  belongs_to :store, inverse_of: :drinks
  belongs_to :user
  has_many :comments, inverse_of: :drink
end
