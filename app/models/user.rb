#
class User < ActiveRecord::Base
  include Authentication
  has_many :stores, inverse_of: :user
  has_many :drinks
end
