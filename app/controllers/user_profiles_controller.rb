class UserProfilesController < ApplicationController
  def edit
    @user_profile = UserProfile.find_by(user: current_user)
  end
end
