class BrowseController < ApplicationController
  def by_search
    @search = true
    query = params[:query]
    location = params[:location]

    @advertisements = Advertisement.search(phrase: query)
    render :browse
  end

  def by_category
    @search = true
    category = Category.find_by_name(params[:category_name].gsub("_", " "))
    @advertisements = Advertisement.where(category: category)
    render :browse
  end
end
