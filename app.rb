require 'sinatra'
require 'sinatra/reloader'
require './lib/word'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:index)
end

get('/word_form') do
  erb(:word_form)
end
