class DeviseRegistrationsController < Devise::RegistrationsController
  def edit
  end

  def show_destroy
    @user = current_user
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
    params.require(:user).permit(:current_password)
  end
end
