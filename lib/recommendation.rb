#this code is based on a blog and is essentially the 
#work of Shun Yao. source is found here https://medium.com/@ysmiracle/build-a-recommendation-engine-in-ruby-f6c4b44f2916

#original idea to sort movies by most likes recieved and cherry pick the top 10
#however, this algorithm seemed to have more substance.

module Recommendation
    def recommend_movies 
        other_users = self.class.all.where.not(id: self.id)

        recommended = Hash.new(0)

        other_users.each do |user|
            common_movies = user.movies & self.movies

            #this is where the recomendation weighting is calculated
            weight = common_movies.size.to_f / user.movies.size

            (user.movies - common_movies).each do |movie|
                recommended[movie] += weight
            end
        end
        sorted_recommended = recommended.sort_by {|key, value| value}.reverse 
    end
end