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

post('/word_form') do
  word = params.fetch('word')
  definition = params.fetch('definition')
  new_word = Word.new(word)
  new_word.store_definition(Definition.new(definition))
  redirect('/')
end

get('/word/:id') do
  @current_word = Word.find(params.fetch('id').to_i)
  erb(:word)
end
