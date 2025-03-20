class Appliance < ApplicationRecord
  belongs_to :user
  validate :user_must_be_merchant

  has_many :reviews, dependent: :destroy
  has_many :favourites
  has_many :offers, dependent: :destroy

  private

  def user_must_be_merchant
    errors.add(:user, "must be a merchant") unless user&.merchant?
  end
end
