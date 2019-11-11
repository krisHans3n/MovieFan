json.extract! movie, :id, :Title, :Director, :Duration, :Genre, :Year, :imdbscore, :created_at, :updated_at
json.url movie_url(movie, format: :json)
