class MovieDB
  def self.get_movies(movies)
    Imdb::Search.new(movies).movies
  end
end
