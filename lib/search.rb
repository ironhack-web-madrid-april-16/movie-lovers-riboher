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
      if !@movies[counter].poster.nil? && !@movies[counter].year.nil?
        years << @movies[counter].year
        # binding.pry
      end
      counter += 1
    end
    years
  end

  def check_answer(years_matcher,quiz_question,answer)
    years_matcher[answer] == quiz_question ? true : false
  end
end

