# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

# seeds products into db using db/products.json
products_json = File.read(File.expand_path('products.json', __dir__))
products = JSON.parse(products_json, { symbolize_names: true })
products.each do |product|
  Product.create(product)
end
