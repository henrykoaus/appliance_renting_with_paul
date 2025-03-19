# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
import "faker"
require 'net/http'
require 'json'

Appliance.destroy_all
#
20.times do
  url = URI("https://api.unsplash.com/photos/random?client_id=4SNI-X9XtwrDDQH3JrvQfknmNtuvpnrsVemUhP1uPGk&query=house&orientation=landscape")

  begin
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
  rescue StandardError => e
    { error: "Failed to fetch image: #{e.message}" }
  end
  Appliance.create!(
    photo_url: data['urls']['raw'],
    name: Faker::Name.name,
    address: Faker::Address.full_address,
    availability: "March 19-April 1",
    price:(50..100).to_a.sample,
    overview:  Faker::Lorem.sentence,
    user: User.all.sample
  )
end
