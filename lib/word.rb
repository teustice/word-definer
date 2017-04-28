class Word
  attr_accessor(:word, :definitions)
  def initialize(word)
    @word = word
    @definitions = []
  end
end
