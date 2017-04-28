class Word
  attr_accessor(:word, :definitions, :image, :id, :match_counter)
  @@words = []
  @@working_word = nil

  def initialize(word)
    @word = word
    @definitions = []
    @image = nil
    @id = @@words.length + 1
    @match_counter = 0
    @@words.push(self)
  end

  def Word.all
    @@words
  end

  def Word.clear
    @@words = []
  end

  def Word.get_working_word
    @@working_word
  end

  def Word.search(query)
    query_char_array = query.split("")
    @@words.each do |word|
      word.match_counter = 0
      word_char_array = word.word.downcase.split("")
      word_char_array.each do |word_letter|
        query_char_array.each do |query_letter|
          if word_letter == query_letter
            word.match_counter += 1
          end
        end
      end
    end
    sorted_words = @@words.sort { |a, b|  b.match_counter <=> a.match_counter }
    sorted_words
  end

  def Word.store_working_word(word)
    @@working_word = word
  end

  def Word.find(id)
    found_word = nil
    @@words.each do |word|
      if word.id == id
        found_word = word
      end
    end
    found_word
  end

  def store_definition(definition)
    @definitions.push(definition)
  end

end

class Definition
  attr_accessor(:definition)
  def initialize(definition)
    @definition = definition
  end
end
