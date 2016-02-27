class DrinkSerializer < ActiveModel::Serializer
  attributes :id, :name, :ingredients, :toppings, :notes
end
