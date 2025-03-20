class Booking < ApplicationRecord
  belongs_to :appliance
  belongs_to :booking_list

  validates :appliance_id, uniqueness: { scope: :booking_list_id }
end
