class AddDatesToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :check_in_date, :string
    add_column :bookings, :check_out_date, :string
  end
end
