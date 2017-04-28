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
  Word.store_working_word(Word.find(params.fetch('id').to_i))
  erb(:word)
end

get('/definition_form') do
  erb(:definition_form)
end

post('/definition_form')do
  definition = params.fetch('definition')
  Word.get_working_word.store_definition(Definition.new(definition))
  redirect('/word/' + Word.get_working_word.id.to_s)
end

get('/image_form') do
  erb(:image_form)
end

post('/image_form') do
  img_url = params.fetch('image')
  Word.get_working_word.image = img_url
  redirect('/word/' + Word.get_working_word.id.to_s)
end

get('/all_words') do
  erb(:all_words)
end
