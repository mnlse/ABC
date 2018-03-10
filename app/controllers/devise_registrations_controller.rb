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
        redirect_to root_path
      end
    else
      flash[:alert] = "Incorrect password"
      redirect_to edit_user_registration_path
    end

  end

  def destroy
    byebug
    if resource.destroy_with_password(params[:user][:current_password])
      flash[:notice] = "Your account has been deleted"
      redirect_to root_path
    else
      flash[:alert] = "Wrong password"
      render :edit, layout: 'application'
    end
  end

  def resource_params
    params.require(:user).permit(:username)
  end
end
