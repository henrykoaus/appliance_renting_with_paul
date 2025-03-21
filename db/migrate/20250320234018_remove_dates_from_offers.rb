class RemoveDatesFromOffers < ActiveRecord::Migration[7.1]
  def change
    remove_column :offers, :check_in_date, :date
    remove_column :offers, :check_out_date, :date
  end
end
