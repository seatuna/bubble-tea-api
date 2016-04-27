class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :toppings, :notes, :current_user, :store_id, :comments

  def current_user
    scope == object.user
  end
end
