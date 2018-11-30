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
