class BookingListsController < ApplicationController
  def index
    @booking_list = current_user.booking_list
    @user = current_user
  end
end
