class Drink < ActiveRecord::Base
  belongs_to :store, inverse_of: :drinks
  belongs_to :user, inverse_of: :drinks
  has_many :comments, inverse_of: :drink
end
