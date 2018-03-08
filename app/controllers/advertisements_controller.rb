class AdvertisementsController < ApplicationController
  def new
    @search = false
    @advertisement = Advertisement.new

    @categories = Category.all.collect { |cat| [cat.name, cat.id] }
  end
end
