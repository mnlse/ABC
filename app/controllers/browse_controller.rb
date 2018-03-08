class BrowseController < ApplicationController
  def by_search
    @search = true
    query = params[:query]
    location = params[:location]

    if query && location.blank?
      @advertisements = Advertisement.where("lower(title) LIKE lower(?)", query)
    else

    end
  end
  def by_category
    category = params[:category]
  end
end
