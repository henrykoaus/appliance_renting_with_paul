# app/controllers/profiles_controller.rb
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
    @user = current_user
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile

    # Explicitly attach the photo
    @profile.photo.attach(profile_params[:photo]) if profile_params[:photo].present?
    if @profile.save
      redirect_to profile_path, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:photo)
  end
end