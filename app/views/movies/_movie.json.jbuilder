json.extract! movie, :id, :Name, :Release_year, :genre, :Main_actor, :string, :created_at, :updated_at
json.url movie_url(movie, format: :json)
