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
      add_def = { :add_definition => "able to withstand great force or pressure" }
      @dummy.add_definition(add_def)
      expect(@dummy.definitions[-1]).to(eq("able to withstand great force or pressure"))
    end
  end

  describe('#image_link') do
    it('checks that a word found by id is returned correctly') do
      @dummy.image_link = "https://pbs.twimg.com/media/DczcImiVAAEn778.jpg"
      expect(@dummy.image_link).to(eq("https://pbs.twimg.com/media/DczcImiVAAEn778.jpg"))
    end
  end

  describe('.sort_switching') do
    it('checks that the list of words is sorted alphabetically, then changed back to ordered by id') do
      expect(Word.all).to(eq([@dummy, @dummy2]))
      Word.sort_alphabetically
      expect(Word.all).to(eq([@dummy2, @dummy]))
      Word.sort_id
      expect(Word.all).to(eq([@dummy, @dummy2]))
    end
  end

end
