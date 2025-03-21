class RemoveDatesFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :check_in_date, :date
    remove_column :bookings, :check_out_date, :date
  end
end
