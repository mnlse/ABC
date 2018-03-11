class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :update]
  def show
    @user = User.find(params[:id])
    @user_profile = @user.user_profile
    @advertisements = @user.advertisements
  end

  def edit
    @user_profile = UserProfile.find_by(user_id: current_user.id)
  end

  def update
    @user_profile = UserProfile.find_by(params[:id])
    if @user_profile.update(user_profile_params)
      flash['notice'] = 'Successfully updated'
      redirect_to root_path
    else
      flash['warning'] = 'There has been an error'
      redirect_back(fallback_location: request.referer)
    end
  end

  private

  def set_user_profile
    @user_profile = UserProfile.find_by(user_id: params[:id])
  end

  def user_profile_params
    params.require(:user_profile).permit(:avatar_image, :background_image)
  end
end
