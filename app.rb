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

post '/test_data' do
  new_word1 = Word.new("Jean-Luc Picard")
  new_word1.image = "https://upload.wikimedia.org/wikipedia/en/2/20/Captain_Picard_Chair.jpg"
  new_word1.definitions.push(Definition.new("Captain of the starship 'Enterprise'"))

  new_word2 = Word.new("William Ryker")
  new_word2.image = "http://vignette3.wikia.nocookie.net/p__/images/3/3b/CommanderRiker.jpg/revision/latest?cb=20160124005107&path-prefix=protagonist"
  new_word2.definitions.push(Definition.new("Enterprise first officer"))

  new_word3 = Word.new("Lt. Cmdr Data")
  new_word3.image = "https://upload.wikimedia.org/wikipedia/en/0/09/DataTNG.jpg"
  new_word3.definitions.push(Definition.new("An android on the starship Enterprise"))

  new_word4 = Word.new("Wesley Crusher")
  new_word4.image = "https://upload.wikimedia.org/wikipedia/en/e/e6/WesleyCrusher2366.jpg"
  new_word4.definitions.push(Definition.new("Ensign on the starship Enterprise"))
  redirect('/')
end
