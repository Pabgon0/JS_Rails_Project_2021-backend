# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first

scrambled_eggs = user.recipes.find_or_create_by(name: "Scrambled Eggs")

pancakes = user.recipes.find_or_create_by(name: "Pancakes")

toast = user.recipes.find_or_create_by(name: "Toast")

sandwich = user.recipes.find_or_create_by(name: "Sandwich")

ingredient_1 = user.ingredients.find_or_create_by(name: "eggs", recipe_id: scrambled_eggs.id)