class GenreController < ApplicationController


    @flist = Movie.search_by_genre(params[:genresearch])
end
