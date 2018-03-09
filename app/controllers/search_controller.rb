class SearchController < ApplicationController
  def index
    @search_terms = params[:q]

    @animes = Anime.where("name LIKE '%#{@search_terms}%'")

  end
end
