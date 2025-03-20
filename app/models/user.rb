class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews, dependent: :destroy
  has_one :favourite_list
  has_one :offer_list
  has_many :appliances, foreign_key: :user_id, dependent: :destroy
  has_many :offers, dependent: :destroy
  enum :role, [ :customer, :merchant ]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
