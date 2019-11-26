class GenreController < ApplicationController


       def index
          @genrelist = Movie.search_by_genre(params[:genresearch])
       end

end
