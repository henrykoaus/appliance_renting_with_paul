class Appliance < ApplicationRecord
  belongs_to :user
  belongs_to :favourite_list
  has_many :reviews
end
