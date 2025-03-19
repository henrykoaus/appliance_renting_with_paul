class ChangeUserToFavouriteListInFavourites < ActiveRecord::Migration[7.1]
  def change
    # Remove the existing user reference (including foreign key and index)
    remove_reference :favourites, :user, foreign_key: true

    # Add the new favourite_list reference (with foreign key and index)
    add_reference :favourites, :favourite_list, foreign_key: true
  end
end
