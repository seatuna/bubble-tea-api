#
class User < ActiveRecord::Base
  include Authentication
  has_many :drinks, inverse_of: :user
  has_many :stores, inverse_of: :user
end
