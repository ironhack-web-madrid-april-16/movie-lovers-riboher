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
  #binding.pry
  @@search = Search.new(@@movies)
  @@posters = @@search.get_poster
  @@gen_question = rand(2)
  @@question = @@search.randomize_question(@@gen_question)
  @@quiz_key = @@question[rand(@@question.length)]
  redirect to('show_movie')
end

get '/show_movie' do
  erb(:posters)
end

get '/check_result/:movie_index' do
  answer = params[:movie_index].to_i
  @@correct = @@search.check_answer(@@question,@@quiz_key,answer)
  redirect to('/result')
end

get '/result' do
  erb(:result)
end


