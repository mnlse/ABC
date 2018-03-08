class AdvertisementsController < ApplicationController
  def new
    @search = false
    @advertisement = Advertisement.new

    @categories = Category.all.collect { |cat| [cat.name, cat.id] }
  end

  def create
    @advertisement = Advertisement.new(permitted_params)
    if @advertisement.save
      flash[:notice] = "Successfully saved advertisement."
      redirect_to root_path
    else
      flash[:error] = "Failed to save advertisement"
      render :new
    end
  end

  private
  def permitted_params
    params.require(:advertisement).permit(:category_id, :title, :description)
  end
end
