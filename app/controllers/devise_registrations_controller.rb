class DeviseRegistrationsController < Devise::RegistrationsController
  def edit
  end

  def edit_destroy
    @user = current_user
  end

  def edit_appearance
    @user = current_user
  end

  def edit_password
    @user = current_user
  end

  def update
    @user = resource

    if @user.valid_password?(params[:user][:current_password])
      if @user.update(resource_params)
        flash[:notice] = "Successfully updated profile..."

        # If new password
        if(params[:user][:password])
          flash[:info] = "Please log in"
          redirect_to new_user_session_path
        else
          redirect_back(fallback_location: root_path)
        end
      end
    else
      flash[:alert] = "Incorrect password"
      redirect_back(fallback_location: edit_user_registration_path)
    end
  end

  def destroy
    if resource.destroy_with_password(params[:user][:current_password])
      flash[:notice] = "Your account has been deleted"
      redirect_to root_path
    else
      flash[:alert] = "Wrong password"
      render :edit, layout: 'application'
    end
  end

  def resource_params
    params.require(:user).permit(:username, :password, :password_confirmation, :avatar)
  end
end
