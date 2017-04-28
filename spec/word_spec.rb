require "word"
require "rspec"
require "pry"


describe(Word) do
  before do
    Word.clear
  end
  
  describe("Word#initialize") do
    it("initializes object with it's properties") do
      new_word = Word.new("candle")
      expect(new_word.word).to(eq("candle"))
    end

    it("pushes the word into a class variable") do
      Word.new("candle")
      expect(Word.all[0]).to(eq("candle"))
    end
  end
end
