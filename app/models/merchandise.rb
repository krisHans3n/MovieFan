require './lib/recommendation.rb'

class Merchandise < ApplicationRecord
    has_one :stock
    has_one :movie
    belongs_to :user, optional: true 
    has_many :order_items
    has_many :items_ordered

    

    def self.search_poster_title(search)
        if search 
               movie_title = Merchandise.select(:id).where(" lower(\"name\") like ?", "%" + search.gsub(/\A\p{Space}*|\p{Space}*\z/, '').downcase + "%")
                if movie_title 
                self.where(id: movie_title)
                else
                Merchandise.all
                end
            else
       Merchandise.all
            end
    end
    


    

end
