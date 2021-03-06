class Movie < ApplicationRecord
belongs_to :country, optional: true
belongs_to :merchandise, optional: true
has_many :movieswatcheds
has_many :users, through: :movieswatcheds


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
        end
end

def self.search_by_genre(genresearch)
    if genresearch 
        movie_by_genre = Movie.select(:id).where(" lower(\"Genre\") like ?", "%" + genresearch.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
        if movie_by_genre
            self.where(id: movie_by_genre) 
        else
        Movie.all
    end
else
    Movie.all
end
end

def self.search_by_keyword(keywordsearch)
    if keywordsearch 
        movie_by_kw = Movie.select(:id).where(" lower(\"keywords\") like ?", "%" + kwordsearch.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
        if movie_by_kw
            self.where(id: movie_by_kw) 
        else
        Movie.all
    end
else
    Movie.all
end
end






end
