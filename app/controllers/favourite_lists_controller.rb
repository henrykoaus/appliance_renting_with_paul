class FavouriteListsController < ApplicationController
  def index
    @favourite_list = current_user.favourite_list
    @user = current_user
  end
end
