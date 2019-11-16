class Movie < ApplicationRecord
belongs_to :countrie, optional: true
belongs_to :merchandise, optional: true

def self.search_by_title(search)
    if search 
      movie = Movie.select(:id).where(" \"Title\" like ?", "%" + search.gsub(/\A\p{Space}*|\p{Space}*\z/, '') + "%")
      if movie 
        self.where(id: movie)
    else
        Movie.all 
    end
else
    Movie.all
#ADD error messaging
  end
end


def self.search_by_genre(genresearch)
end



end
