require './lib/recommendation.rb'

class Merchandise < ApplicationRecord
    has_one :stock
    has_one :movie
    belongs_to :user, optional: true 
    has_many :order_items

    def self.checkposter(checkposter)
        Merchandise.select(id: checkposter)
    end


    

end
