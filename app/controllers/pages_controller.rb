class PagesController < ApplicationController
  def index
    @categories = Category.all
    @search = true

    @recent_ad = Advertisement.published.recent
    @promoted_ad = Advertisement.published.promoted
  end
end
