class Favourite < ApplicationRecord
  belongs_to :user
  belongs_to :appliance
end
