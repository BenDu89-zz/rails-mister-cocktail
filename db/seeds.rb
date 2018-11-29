require 'net/http'
require 'json'
require 'byebug'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "startet"
Ingredient.delete_all
puts "deleted all "

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
uri = URI(url)
response = Net::HTTP.get(uri)
answer = JSON.parse(response)
  answer["drinks"].each do |ans|
    Ingredient.create(name: ans['strIngredient1'])
  end
puts 'Finished!'
