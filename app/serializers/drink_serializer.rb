class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :toppings, :notes, :current_user, :store_id

  def current_user
    scope == object.user
  end
end
