class BookingList < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :appliances, through: :bookings
end
