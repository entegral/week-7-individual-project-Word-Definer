require ('rspec')
require ('pry')
require ('Word')


describe('Word') do 

  it('tests a method for Word') do

    dummy = Word.new()

    expect(dummy.method()).to(eq(expected result))

  end

end

