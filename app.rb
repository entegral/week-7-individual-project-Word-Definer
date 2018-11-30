require 'sinatra'
require 'sinatra/reloader'
also_reload './lib/**/*.rb'
require './lib/Word'
require 'pry'
require 'facets'

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
  @list = Word.all
  @word = Word.find(params['id'])
  erb(:index)
end

post '/word/:id' do
  @list = Word.all
  word = Word.find(params['id'])

  unless params['definition'] == ""
    word.add_definition(params)
  end

  unless params['image_link'] == ""
    word.image_link = params['image_link']
  end
  @word = Word.find(params['id'])
  erb(:index)
end
