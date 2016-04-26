class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
  belongs_to :drink, inverse_of: :comments
end
