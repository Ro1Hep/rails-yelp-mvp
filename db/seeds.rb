# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants...'
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: 'chinese', phone_number: '07546234389' }
pizza_east = { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: 'chinese', phone_number: '07046834689' }
yard_sale = { name: "Yard Sale", address: "The Yard (where the sale is), London", category: 'chinese', phone_number: '0121456566' }
beefy_boys = { name: "Beefy Boys", address: "The New Development, Hereford, HR11UX", category: 'chinese', phone_number: '01432279371' }
som_saa = { name: "Som Saa", address: "Shoreditch, London, E1 6PQ", category: 'chinese', phone_number: '07411393288' }

[dishoom, pizza_east, yard_sale, beefy_boys, som_saa].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end

puts 'Finished!'
