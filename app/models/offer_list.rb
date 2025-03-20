class OfferList < ApplicationRecord
  belongs_to :user
  has_many :offers
  has_many :appliances, through: :offers
end
