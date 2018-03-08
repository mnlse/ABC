class PagesController < ApplicationController
  def index
    @categories = Category.all
    @search = true
  end
end
