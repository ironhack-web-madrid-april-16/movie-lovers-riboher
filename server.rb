require 'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require 'pry'
require 'imdb'
require_relative 'lib/moviedb.rb'
require_relative 'lib/search.rb'

get '/' do
  erb(:movie)
end


post '/searching' do
  movie = params[:movie]
  @@movies = MovieDB.get_movies(movie)
  @@search = Search.new(@@movies)
  # binding.pry
  @@posters = @@search.get_poster
  # binding.pry
  @@years = @@search.get_releases
  # binding.pry
  @@quiz_year = @@years[rand(@@years.length)]
  redirect to('/show_movie')
end

get '/show_movie' do
  erb(:posters)
end

get '/check_result/:movie_index' do
  answer = params[:movie_index].to_i
  @@correct = @@search.check_answer(@@years,@@quiz_year,answer)
  redirect to('/result')
end

get '/result' do
  erb(:result)
end


