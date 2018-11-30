require ('rspec')
require ('capybara/rspec')
require ('pry')
require ('./app')
require ('capybara')
require ('./lib/Word')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('Word', {:type => :feature}) do
  it('checks whether user entered word appears on word list') do
    visit('/')
    fill_in('name', :with => 'strong')
    click_button('Add Word to List')
    expect(page).to have_content('Strong')
  end
end

describe('Word', {:type => :feature}) do
  before do
      Word.clear
      strong = {:name=> "strong", :definition=> "having the power to move heavy weights or perform other physically demanding tasks."}
      @dummy = Word.new(strong)
      @dummy.save
  end

  describe('Word', {:type => :feature}) do
    it('checks whether additional definitions added to word appear on detail card') do
      visit('/word/1')
      fill_in('add_definition', :with => 'prove new def is added to word')
      click_button('Add Definition to Word')
      expect(page).to have_content('prove new def is added to word')
    end
  end



end
