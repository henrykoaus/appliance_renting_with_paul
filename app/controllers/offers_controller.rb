class OffersController < ApplicationController
  before_action :set_offer, only: %i[ destroy ]

  # POST /offers or /offers.json
  def create
    @offer = Offer.new(offer_params)
    @offer.offer_list = current_user.offer_list

    if @offer.save
      flash[:notice] = 'Offer was successfully added!'
      render json: { message: flash[:notice] }, status: :created
    else
      flash[:alert] = 'There was an issue with the creation.'
      render json: { message: flash[:alert], errors: @favourite.errors.full_messages }, status: 500
    end
    # respond_to do |format|
    #   if @offer.save
    #     format.html { redirect_to @offer, notice: "Offer was successfully created." }
    #     format.json { render :show, status: :created, location: @offer }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @offer.errors, status: :unprocessable_entity }
    #   end
  end

  # DELETE /offers/1 or /offers/1.json
  def destroy
    @offer.destroy!

    if @offer.destroy!
      flash[:notice] = 'Offer was successfully removed!'
      render json: { message: flash[:notice] }, status: :ok
    else
      flash[:alert] = "There was an issue with the deletion."
      render json: { message: flash[:alert], errors: @favourite.errors.full_messages }, status: 500
    end
    # respond_to do |format|
    #   format.html { redirect_to offers_path, status: :see_other, notice: "Offer was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_offer
    @offer = Offer.where(appliance_id: params[:id], offer_list: current_user.offer_list)
  end
  # Only allow a list of trusted parameters through.

  def offer_params
    params.require(:offer).permit(:appliance_id)
  end

  # GET /offers or /offers.json
  # def index
  #   @offers = Offer.all
  #   @appliances = Appliance.all
  # end

  # GET /offers/1 or /offers/1.json
  # def show
  # end

  # GET /offers/new
  # def new
  #   @offer = Offer.new
  # end

  # GET /offers/1/edit
  # def edit
  # end

  # # PATCH/PUT /offers/1 or /offers/1.json
  # def update
  #   respond_to do |format|
  #     if @offer.update(offer_params)
  #       format.html { redirect_to @offer, notice: "Offer was successfully updated." }
  #       format.json { render :show, status: :ok, location: @offer }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #       format.json { render json: @offer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
end
