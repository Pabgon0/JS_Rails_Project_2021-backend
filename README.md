# README
/*
t.string :name
t.references :user
*/
Recipe
    belongs_to :user
    has_many :ingredients

/*
t.string :name
t.text :content
t.references :user
t.references :recipe
*/
Ingredient
    belongs_to :user
    belongs_to :recipe