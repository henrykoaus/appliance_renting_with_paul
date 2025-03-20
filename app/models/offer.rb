class Offer < ApplicationRecord
  belongs_to :user
  belongs_to :appliance

  def end_date_after_start_date
    return if check_out_date.blank? || check_in_date.blank?
    if check_out_date < check_in_date
      errors.add(:check_out_date, "must be after the start date")
    end
  end
end
