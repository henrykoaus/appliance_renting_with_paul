class FavouriteListsController < ApplicationController
  before_action :set_favourite_list, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: :new

  # GET /favourite_lists or /favourite_lists.json
  def index
    @favourite_lists = FavouriteList.all
  end

  # GET /favourite_lists/1 or /favourite_lists/1.json
  def show
  end

  # GET /favourite_lists/new
  def new
    @favourite_list = FavouriteList.new
  end

  # GET /favourite_lists/1/edit
  def edit
  end

  # POST /favourite_lists or /favourite_lists.json
  def create
    @favourite_list = FavouriteList.new(favourite_list_params)

    respond_to do |format|
      if @favourite_list.save
        format.html { redirect_to @favourite_list, notice: "Favourite list was successfully created." }
        format.json { render :show, status: :created, location: @favourite_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @favourite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /favourite_lists/1 or /favourite_lists/1.json
  def update
    respond_to do |format|
      if @favourite_list.update(favourite_list_params)
        format.html { redirect_to @favourite_list, notice: "Favourite list was successfully updated." }
        format.json { render :show, status: :ok, location: @favourite_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favourite_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favourite_lists/1 or /favourite_lists/1.json
  def destroy
    @favourite_list.destroy!

    respond_to do |format|
      format.html { redirect_to favourite_lists_path, status: :see_other, notice: "Favourite list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favourite_list
      @favourite_list = FavouriteList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favourite_list_params
      params.require(:favourite_list).permit(:name, :description, :user_id)
    end
end
