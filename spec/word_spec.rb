require "word"
require "rspec"
require "pry"


describe(Word) do
  describe("Word#initialize") do
    it("initializes object with it's properties") do
      new_word = Word.new("candle")
      expect(new_word.word).to(eq("candle"))
    end
  end
end
