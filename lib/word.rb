class Word
  attr_accessor(:word, :definitions, :id)
  @@words = []
  @@working_word = nil

  def initialize(word)
    @word = word
    @definitions = []
    @id = @@words.length + 1
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
