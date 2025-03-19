class Appliance < ApplicationRecord
  belongs_to :user
  validate :user_must_be_merchant

  has_many :reviews, dependent: :destroy
  has_many :favourites

  private

  def user_must_be_merchant
    errors.add(:user, "must be a merchant") unless user&.merchant?
  end
  has_many :offers
end
