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
end
