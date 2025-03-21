class ReviewsController < ApplicationController
  before_action :set_appliance, only: %i[show edit update create]
  before_action :set_review, only: %i[show edit update]

  # GET /appliances/:appliance_id/reviews
  def index
    @user = current_user
    render template: "reviews/index", locals: { reviews: @reviews = current_user.reviews, deletable: true }
  end

  # GET /appliances/:appliance_id/reviews/new
  def new
    @review = Review.new
  end

  # POST /appliances/:appliance_id/reviews
  def create
    @review = Review.new(review_params)
    @review.appliance = @appliance
    @review.user = current_user
    if @review.save
      redirect_to appliance_path(@appliance), notice: "Review was successfully added."
    else
      flash[:alert] = 'There was an issue with the creation of the review'
      render json: { message: flash[:alert], errors: @review.errors.full_messages }, status: 500
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
    @review = Review.find(params[:id])
    if @review.destroy!
      redirect_to reviews_path, notice: "Review was successfully destroyed."
    else
      flash[:alert] = 'There was an issue with creating your model.'
      render json: { message: flash[:alert], errors: @review.errors.full_messages }, status: 500
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
    params.require(:review).permit(:comment, :rating)
  end
end
