class BrowseController < ApplicationController
  def by_search
    @search = true
    query = params[:query]
    location = params[:location]

    if query && location.blank?
      @advertisements = Advertisement.search(phrase: query)
    else

    end
  end
  def by_category
    category = params[:category]
  end
end
