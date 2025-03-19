class FavouriteList < ApplicationRecord
  belongs_to :user
  has_many :favourites
  has_many :appliances, through: :favourites
end
