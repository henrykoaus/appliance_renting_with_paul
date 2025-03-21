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
require 'date'

def self.english_description
  [
    "A beautiful #{Faker::Address.community} located in #{Faker::Address.city}.",
    "Featured #{['spacious living area', 'modern kitchen', 'luxurious bathroom', 'cozy bedroom'].sample}.",
    "Perfect for #{['families', 'couples', 'digital nomads', 'large groups'].sample}.",
    "Amenities include #{Faker::House.room} and #{Faker::House.furniture}."
  ].shuffle.join(' ')
end


Favourite.destroy_all
Booking.destroy_all
Appliance.destroy_all
Offer.destroy_all
FavouriteList.destroy_all
OfferList.destroy_all
BookingList.destroy_all
Profile.destroy_all
User.destroy_all
Review.destroy_all

# add Users
paul = User.new
paul.username = "paul"
paul.email = "paul618300@gmail.com"
paul.password = "123456"
paul.role = 0
paul.favourite_list = FavouriteList.new
paul.offer_list = OfferList.new
paul.profile = Profile.new
paul.booking_list = BookingList.new
paul.save


henry = User.new
henry.username = "henry"
henry.email = "butwoo91@gmail.com"
henry.password = "123456"
henry.role = 1
henry.favourite_list = FavouriteList.new
henry.offer_list = OfferList.new
henry.profile = Profile.new
henry.booking_list = BookingList.new
henry.save

# add appliances
20.times do
    url = URI("https://api.unsplash.com/photos/random?client_id=4SNI-X9XtwrDDQH3JrvQfknmNtuvpnrsVemUhP1uPGk&query=airbnb&orientation=landscape")

  begin
    response = Net::HTTP.get(url)
    data = JSON.parse(response)
  rescue StandardError => e
    { error: "Failed to fetch image: #{e.message}" }
  end
  Appliance.create!(
    photo_url: data['urls']['raw'],
    name: Faker::Appliance.equipment,
    address: Faker::Address.full_address,
    availability: "March 19-April 1",
    price: (50..100).to_a.sample,
    overview: english_description,
    user: henry
  )
end

# add favourites

20.times do
  favourite = Favourite.new
  favourite.name = Faker::Name.name
  favourite.description =  Faker::Lorem.sentence
  favourite.favourite_list = FavouriteList.all.sample
  favourite.appliance = Appliance.all.sample
  favourite.save
end

# 10.times do
#   offer = Offer.new
#   offer.offer_list = OfferList.all.sample
#   offer.appliance = Appliance.all.sample
#   offer.save
# end

10.times do
  booking = Booking.new
  booking.check_in_date = "2025-03-18"
  booking.check_out_date = "2025-03-21"
  booking.total_price = rand(0..1000)
  booking.booking_list = BookingList.all.sample
  booking.appliance = Appliance.all.sample
  booking.save
end

# add reviews
100.times do
  review = Review.new
  review.comment = Faker::Lorem.paragraph(sentence_count: 3, supplemental: true)
  review.rating = (1..5).to_a.sample.to_f
  review.appliance = Appliance.all.sample
  review.user = User.all.sample
  review.save
end
