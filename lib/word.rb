class Word
  attr_accessor(:word, :definitions)
  @@words = []

  def initialize(word)
    @word = word
    @definitions = []
    @@words.push(word)
  end

  def Word.all
    @@words
  end

  def Word.clear
    @@words = []
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
