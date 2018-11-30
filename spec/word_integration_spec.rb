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
    fill_in('user_answer', :with => 'Mr. Fluffles')
    click_button('Submit answer')
    expect(page).to have_content('Nope, wrong, you suck!')
  end
end
