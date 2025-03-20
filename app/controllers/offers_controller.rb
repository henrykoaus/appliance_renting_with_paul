class OffersController < ApplicationController
  before_action :set_offer, only: %i[ show edit update destroy book ]

  # GET /offers or /offers.json
  def index
    @offers = Offer.where(user_id: nil) # Only show available offers
    @appliances = Appliance.all
  end

  # GET /offers/1 or /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: "Offer was successfully created." }
        format.json { render :show, status: :created, location: @offer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offers/1 or /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: "Offer was successfully updated." }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH /offers/1/book
  def book
    if @offer.user_id.nil?
      @offer.update(user_id: current_user.id)
      redirect_to @offer, notice: "Offer successfully booked!"
    else
      redirect_to @offer, alert: "This offer is already booked."
    end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy!

    respond_to do |format|
      format.html { redirect_to offers_path, status: :see_other, notice: "Offer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def offer_params
      params.require(:offer).permit(:check_in_date, :check_out_date, :user_id, :appliance_id)
    end
end
