class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy
  has_many :appliances, foreign_key: :user_id, dependent: :destroy
  has_one :favourite_list, dependent: :destroy
  has_one :offer_list,  dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :booking_list, dependent: :destroy
  after_create :create

  enum :role, [ :customer, :merchant ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private
  def create
    Profile.create(user: self)
    FavouriteList.create(user: self)
    OfferList.create(user: self)
  end
end
