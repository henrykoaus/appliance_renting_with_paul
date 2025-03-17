class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :favourite_list
end
