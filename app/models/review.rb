class Review < ApplicationRecord
  belongs_to :appliance
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
