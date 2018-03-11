class PagesController < ApplicationController
  include ApplicationHelper   # for guest user handling capabilities

  def index
    @categories = Category.all
    @search = true
    @recent_ads = Advertisement.published.recent.limit(12)

    @city_name = ::Geocoder.address(request.remote_ip)
    if user_signed_in?
      @promoted_ads_in_city = Advertisement.promoted.published.where(city: current_user.city_last_known)
    else
      @promoted_ads_in_city = Advertisement.promoted.published.where(city: @city_name )
    end

  end
end
