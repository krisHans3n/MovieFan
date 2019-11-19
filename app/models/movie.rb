class Movie < ApplicationRecord
belongs_to :countrie, optional: true
belongs_to :merchandise, optional: true
has_many :movieswatcheds

def self.search_by_title(search)
    if search 
      movie = Movie.select(:id).where(" lower(\"Title\") like ?", "%" + search.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
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
    if genresearch 
        movie_by_genre = Movie.select(:id).where(" lower(\"Genre\") like ?", "%" + genresearch.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
        if movie
            self.where(id: movie_by_genre) 
        end
        Movie.all
    end
    Movie.all
end

def self.search_by_keyword(kwordsearch)
    if kwordsearch 
        movie_by_kw = Movie.select(:id).where(" lower(\"keywords\") like ?", "%" + kwordsearch.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
        if movie
            self.where(id: movie_by_kw) 
        end
        Movie.all
    end
    Movie.all
end


end
