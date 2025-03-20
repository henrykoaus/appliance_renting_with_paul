class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :appliance
  belongs_to :offer_list

  validates :appliance_id, uniqueness: { scope: :offer_list_id }
end
