class Offer < ApplicationRecord
  belongs_to :offer_list
  belongs_to :appliance

  validates :appliance_id, uniqueness: { scope: :offer_list_id }
end
