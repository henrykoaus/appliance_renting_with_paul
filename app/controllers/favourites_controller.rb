class FavouritesController < ApplicationController
  before_action :set_favourite, only: %i[ destroy ]

  # POST /favourites or /favourites.json
  def create
    @favourite = Favourite.new(favourite_params)
    @favourite.favourite_list = current_user.favourite_list
    if @favourite.save
      flash[:notice] = "successfully added!"
      render json: { message: flash[:notice] }, status: :created
    else
      flash[:alert] = "There was an issue with creating your model."
      render json: { message: flash[:alert], errors: @favourite.errors.full_messages }, status: 500
    end
  end

  # DELETE /favourites/1 or /favourites/1.json
  def destroy
    @favourite.destroy!

    respond_to do |format|
      format.html { redirect_to favourites_path, status: :see_other, notice: "Favourite was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite
      @favourite = Favourite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_params
      params.require(:favourite).permit(:appliance_id)
    end
end
