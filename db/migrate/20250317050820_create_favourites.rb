class CreateFavourites < ActiveRecord::Migration[7.1]
  def change
    create_table :favourites do |t|
      t.string :name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :appliance, null: false, foreign_key: true

      t.timestamps
    end
  end
end
