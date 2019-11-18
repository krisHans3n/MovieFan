class GenreController < ApplicationController


       #variable should be different // redirect to another page perhaps
    @flist = Movie.search_by_genre(params[:genresearch])
end
