class CreateOffers < ActiveRecord::Migration[7.1]
  def change
    create_table :offers do |t|
      t.date :check_in_date
      t.date :check_out_date
      t.references :user, null: false, foreign_key: true
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
