class AddOfferListToOffer < ActiveRecord::Migration[7.1]
  def change
    add_reference :offers, :offer_list, null: false, foreign_key: true
  end
end
