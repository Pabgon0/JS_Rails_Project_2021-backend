class IngredientSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :content, :recipe_id
end
