class Appliance < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
end
