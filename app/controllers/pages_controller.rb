class PagesController < ApplicationController
  include ApplicationHelper   # for guest user handling capabilities

  def index
    @categories = Category.all
    @search = true

    @recent_ads = Advertisement.published.recent.limit(12)
    @promoted_ads_in_city = Advertisement.promoted.published.where(city: current_user.city_last_known)
  end
end
