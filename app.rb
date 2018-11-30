require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require './lib/Word'
require 'pry'


get '/' do
  @list = Word.all
  erb(:index)
end

post '/' do
  word = Word.new(params)
  word.save
  @list = Word.all
  erb(:index)
end

get '/word/:id' do
  @list = Word.find(params['id'])
  erb(:index)
end

post '/word/:id' do
  word = Word.find(params['id'])
  word.add_definition(params)
  @list = Word.find(params['id'])
  erb(:index)
end
