class PagesController < ApplicationController
  def index
    @categories = Category.all
    @search = true

    @recent = Advertisement.recent
  end
end
