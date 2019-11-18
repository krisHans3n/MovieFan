module MovieswatchedsHelper
before_action :require_login

def update 
    @movie = Movie.find(params[:moviewatched])
    #further is needed // the link submits a record in 
    #the model from which automated admin upon user login
    #will filter suggested movies based on the users history
    #https://stackoverflow.com/questions/19123643/rails-model-for-movie-watched-status/19123820
end


end
