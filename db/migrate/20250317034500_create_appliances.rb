class CreateAppliances < ActiveRecord::Migration[7.1]
  def change
    create_table :appliances do |t|
      t.string :photo_url
      t.string :name
      t.string :address
      t.string :availability
      t.float :price
      t.text :overview
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
