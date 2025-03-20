class Appliance < ApplicationRecord
  belongs_to :user
  validate :user_must_be_merchant

  has_many :reviews, dependent: :destroy
  has_many :favourites
  has_many :offers

  # PgSearch
  include PgSearch::Model
  pg_search_scope :search_by_address_and_price,
                  against: :address,
                  using: {
                    tsearch: { prefix: true }
                  }
                  # ignoring: :accents

  scope :price_in_range, ->(min_price, max_price) { where(price: min_price..max_price) }

  def self.search(address, min_price, max_price)
    min_price = min_price.present? ? min_price.to_f : 0.0
    max_price = max_price.present? ? max_price.to_f : 1_000_000.0
    base_scope = price_in_range(min_price, max_price)

    if address.present?
      base_scope.search_by_address_and_price(address)
    else
      base_scope
    end

  end
  # average_rating from reviews
  def average_rating
    reviews.average(:rating).to_f
  end

  private

  def user_must_be_merchant
    errors.add(:user, "must be a merchant") unless user&.merchant?
  end

end
