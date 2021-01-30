class RecipeIngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :active
  has_many :ingredients
end
