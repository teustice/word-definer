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
      expect(Word.all[0].word).to(eq("candle"))
    end
  end

  describe("Word#store_definition") do
    it("stores a definition in a word instance") do
      new_word = Word.new("candle")
      new_word.store_definition(Definition.new("A wax cylinder"))
      expect(new_word.definitions[0].definition).to(eq("A wax cylinder"))
    end
  end

  describe("Word.search") do
    it("returns a list sorted by most character matches in the words array") do
      Word.new("candle")
      Word.new("flashlight")
      Word.new("salad")
      Word.new("money")
      expect(Word.search("salad")[0].word).to(eq("salad"))
    end
  end
end

describe(Definition) do
  describe("Definition#initialize") do
    it("initializes object with it's properties") do
      new_def = Definition.new("A wax cylinder")
      expect(new_def.definition).to(eq("A wax cylinder"))
    end
  end
end
