class Favourite < ApplicationRecord
  belongs_to :favourite_list
  belongs_to :appliance

  validates :appliance_id, uniqueness: { scope: :favourite_list_id }
end
