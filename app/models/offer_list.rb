class OfferList < ApplicationRecord
  belongs_to :user
  has_many :offers, dependent: :destroy
  has_many :appliances, through: :offers
end
