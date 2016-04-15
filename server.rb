require 'sinatra'
require 'haml'
require 'sinatra/reloader' if development?
require 'pry'
require 'imdb'
require_relative 'lib/search.rb'

get '/' do
  erb(:movie)
end


post '/searching' do
  # binding.pry
  movie = params[:movie]
  @@search = Search.new(movie)
  @@posters = @@search.get_poster
  @@years = @@search.get_releases
  # binding.pry
  @@quiz_year = @@years[rand(@@years.length)]
  # binding.pry
  redirect to('/show_movie')
end

get '/show_movie' do
  erb(:posters)
end

post '/check_result/:movie_index' do
  answer = params[:movie_index].to_i
  @@correct = @@search.check_answer(@@years,@@quiz_year,answer)
  redirect to('/result')
end

get '/result' do
  erb(:result)
end


