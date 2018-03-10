class PagesController < ApplicationController
  def index
    @categories = Category.all
    @search = true

    @recent_ads = Advertisement.published.recent
    @promoted_ads = Advertisement.published.promoted.limit(8)
  end
end
