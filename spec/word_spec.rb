require ('rspec')
require ('pry')
require ('Word')


describe('Word') do

  before do
      Word.clear
      strong = {:name=> "strong", :definition=> "having the power to move heavy weights or perform other physically demanding tasks."}
      robust = {:name=> "robust", :definition=> "strong and healthy; vigorous."}
      @dummy = Word.new(strong)
      @dummy.save
      @dummy2 = Word.new(robust)
      @dummy2.save
    end

  describe('#save') do
    it('checks that a word added to the word_list is saved appropriately') do
      Word.clear
      expect(@dummy.save).to(eq([@dummy]))
    end
  end

  describe('.all') do
    it('checks that all words added to the word_list are returned from class method') do
      expect(Word.all).to(eq([@dummy, @dummy2]))
    end
  end

  describe('.clear') do
    it('checks that all words are cleared from the word_list') do
      expect(Word.clear).to(eq([]))
    end
  end

  describe('.find') do
    it('checks that a word found by id is returned correctly') do
      expect(Word.find(1)).to(eq(@dummy))
      expect(Word.find(2)).to(eq(@dummy2))
    end
  end

  describe('#add_definition') do
    it('checks a definition added to a word is added to the word\'s array') do
      add_def = { :definition => "able to withstand great force or pressure" }
      @dummy.add_definition(add_def)
      expect(@dummy.definitions[-1]).to(eq("able to withstand great force or pressure"))
    end
  end

end
