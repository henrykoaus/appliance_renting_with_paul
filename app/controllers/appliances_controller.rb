class AppliancesController < ApplicationController
  before_action :set_appliance, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new ]

  # GET /appliances or /appliances.json
  def index
    @appliances = Appliance.all
  end

  # GET /appliances/1 or /appliances/1.json
  def show
    @review = Review.new
    @offers = @appliance.offers
  end

  # GET /appliances/new
  def new
    @appliance = Appliance.new
  end

  # GET /appliances/1/edit
  def edit
  end

  # POST /appliances or /appliances.json
  def create
    @appliance = Appliance.new(appliance_params)
    @appliance.user = current_user
    # raise
    respond_to do |format|
      if @appliance.save
        format.html { redirect_to @appliance, notice: "Appliance was successfully created." }
        format.json { render :show, status: :created, location: @appliance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appliances/1 or /appliances/1.json
  def update
    respond_to do |format|
      if @appliance.update(appliance_params)
        format.html { redirect_to @appliance, notice: "Appliance was successfully updated." }
        format.json { render :show, status: :ok, location: @appliance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appliances/1 or /appliances/1.json
  def destroy
    @appliance.destroy!

    respond_to do |format|
      format.html { redirect_to appliances_path, status: :see_other, notice: "Appliance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appliance
      @appliance = Appliance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appliance_params
      params.require(:appliance).permit(:photo_url, :name, :address, :availability, :price, :overview, :user_id)
    end
end
