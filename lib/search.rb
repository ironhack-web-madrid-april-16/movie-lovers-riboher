# This class uses a method that takes IMDB gem and searches for a movie
# containing the word passed as a parameter
require 'imdb'
require 'pry'

class Search

  def initialize(movie)
    @movies = Imdb::Search.new(movie).movies[0..20]
    binding.pry
  end

  def get_poster
    @posters = @movies
    @posters.map{|m| m.poster if !m.poster.nil? && !m.year.nil?}
    binding.pry
    posters.slice!(0,9)
  end

  def get_releases
    @years = @movies
    @years.map{|m| m.year if !m.poster.nil? && !m.year.nil?}
    binding.pry
    years.slice!(0,9)
  end

  def check_answer(years_matcher,quiz_question,answer)
    years_matcher[answer] == quiz_question ? true : false
  end
end

