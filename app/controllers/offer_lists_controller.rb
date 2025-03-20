class OfferListsController < ApplicationController
  def index
    @offer_list = current_user.offer_list
    @user = current_user
  end
end
