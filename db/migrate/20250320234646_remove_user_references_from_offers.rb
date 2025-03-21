class RemoveUserReferencesFromOffers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :offers, :user, null: false, foreign_key: true
  end
end
