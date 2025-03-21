class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ destroy ]

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.booking_list = current_user.booking_list

    if @booking.save
      flash[:notice] = 'Booking was successfully added!'
      render json: { message: flash[:notice] }, status: :created
    else
      flash[:alert] = 'There was an issue with the creation.'
      render json: { message: flash[:alert], errors: @booking.errors.full_messages }, status: 500
    end
    # respond_to do |format|
    #   if @booking.save
    #     format.html { redirect_to @booking, notice: "Booking was successfully created." }
    #     format.json { render :show, status: :created, location: @booking }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @booking.errors, status: :unprocessable_entity }
    #   end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy!

    if @booking.destroy!
      flash[:notice] = 'Booking was successfully removed!'
      render json: { message: flash[:notice] }, status: :ok
    else
      flash[:alert] = "There was an issue with the deletion."
      render json: { message: flash[:alert], errors: @booking.errors.full_messages }, status: 500
    end
    # respond_to do |format|
    #   format.html { redirect_to bookings_path, status: :see_other, notice: "Booking was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.where(appliance_id: params[:id], booking_list: current_user.booking_list).first
  end
  # Only allow a list of trusted parameters through.

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :total_price, :appliance_id)
  end

  # GET /bookings or /bookings.json
  # def index
  #   @bookings = Booking.all
  #   @appliances = Appliance.all
  # end

  # GET /bookings/1 or /bookings/1.json
  # def show
  # end

  # GET /bookings/new
  # def new
  #   @booking = Booking.new
  # end

  # GET /bookings/1/edit
  # def edit
  # end

  # # PATCH/PUT /bookings/1 or /bookings/1.json
  # def update
  #   respond_to do |format|
  #     if @booking.update(booking_params)
  #       format.html { redirect_to @booking, notice: "Booking was successfully updated." }
  #       format.json { render :show, status: :ok, location: @booking }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @booking.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
