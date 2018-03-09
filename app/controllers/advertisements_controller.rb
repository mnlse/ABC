class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: [:edit, :update, :show, :preview]
  def new
    @advertisement = current_user.advertisements.new
    @advertisement.pictures.build
  end

  def edit
  end

  def show
    @search = true
  end

  def preview
  end

  def update
    if @advertisement.update(permitted_params)
      flash[:notice] = "Successfully updated"
      render :edit, layout: 'application'
    end
  end

  def create
    @advertisement = current_user.advertisements.new(permitted_params)
    if @advertisement.save && @advertisement.published
      flash[:notice] = "Successfully published advertisement."
      redirect_to @advertisement
    elsif @advertisement.save
      flash[:notice] = "Successfully saved draft"
      redirect_to edit_advertisement_path(@advertisement)
    else
      flash[:alert] = "Failed to save advertisement..."
      render :new, layout: 'application'
    end
  end

  private
  def permitted_params
    params.require(:advertisement).permit(:category_id, :price, :published, :title, :description, :main_image, pictures_attributes: [:image])
  end

  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end
end
