class ReviewsController < ApplicationController
  before_action :set_appliance
  before_action :set_review, only: %i[show edit update destroy]

  # GET /appliances/:appliance_id/reviews
  def index
    if params[:appliance_id]
      @appliance = Appliance.find(params[:appliance_id])
      @reviews = @appliance.reviews
    else
      @reviews = Review.all
    end
  end

  # GET /appliances/:appliance_id/reviews/:id
  def show
  end

  # GET /appliances/:appliance_id/reviews/new
  def new
    @review = Review.new
  end

  # GET /appliances/:appliance_id/reviews/:id/edit
  def edit
  end

  # POST /appliances/:appliance_id/reviews
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to appliance_review_path(@appliance, @review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appliances/:appliance_id/reviews/:id
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to appliance_review_path(@appliance, @review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appliances/:appliance_id/reviews/:id
  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to appliance_reviews_path(@appliance), status: :see_other, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_appliance
    @appliance = Appliance.find(params[:appliance_id])
  end

  def set_review
    @review = @appliance.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating, :user_id)
  end
end
