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

get '/sort_alphabetically' do
  Word.sort_alphabetically
  redirect '/'
  erb(:index)
end

get '/sort_id' do
  Word.sort_id
  redirect '/'
end

get '/search' do
  @list = Word.all
  @word = Word.find_by_name(params['search'])
  unless @word
    @search_word = params['search']
    return erb(:not_found)
  end
  erb(:index)
end

get '/view_all' do
  @list = Word.all
  erb(:view_all)
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

  unless params['add_definition'] == ""
    word.add_definition(params)
  end

  unless params['image_link'] == ""
    word.image_link = params['image_link']
  end
  @word = Word.find(params['id'])
  erb(:index)
end
