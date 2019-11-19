class GenreController < ApplicationController


       #variable should be different // redirect to another page perhaps
       def index
        @movies = Movie.all
          @genrelist = @movies.search_by_genre(params[:genresearch])
          redirect_to movies_path
       end

#add private method
#

end
