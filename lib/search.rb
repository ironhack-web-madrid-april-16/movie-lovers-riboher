# This class uses a method that takes IMDB gem and searches for a movie
# containing the word passed as a parameter
require 'imdb'
require 'pry'

class Search

  def initialize(movies)
    @movies = movies
  end

  def get_poster
    counter = 0
    posters = []
    while posters.size < 9 do
      posters << @movies[counter].poster unless @movies[counter].poster.nil?
      counter += 1
    end
    posters
  end

  def get_releases
    counter = 0
    years = []
    while years.size < 9 do
      years << @movies[counter].year unless @movies[counter].poster.nil?
      counter += 1
    end
    years
  end

  def get_directors
    counter = 0
    directors = []
    while directors.size < 9 do
      directors << @movies[counter].director unless @movies[counter].poster.nil?
      counter += 1
    end
    directors
  end

  def randomize_question(num)
    num == 0 ? get_releases : get_directors
  end

  def check_answer(years_matcher,quiz_question,answer)
    years_matcher[answer] == quiz_question ? true : false
  end
end

