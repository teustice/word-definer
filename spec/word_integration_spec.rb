require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the add word path", {:type => :feature}) do
  it("processes the user input and creates a new word object") do
    visit("/word_form")
    fill_in("word", :with => "Banana")
    fill_in("definition", :with => "A delicious fruit")
    click_button("Add")
    expect(page).to have_content("Banana")
  end
end

describe("the description form path", {:type => :feature}) do
  it("enters a specific word page, and adds a description") do
    visit("/")
    click_link("Banana")
    click_link("Add a definition")
    fill_in("definition", :with => "A really yellow fruit!")
    click_button("Add")
    expect(page).to have_content("A really yellow fruit!")
  end
end

describe("the image form path", {:type => :feature}) do
  it("enters a specific word page, and adds an image") do
    visit("/")
    click_link("Banana")
    click_link("Add an image")
    fill_in("image", :with => "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRBjRiK6owVCJ_Il3iEFYeHgeXmg7YVup5BTDkQ_gj1O7K8Dvrw-tnyK8A")
    click_button("Add")
    expect(page).to have_content("Banana")
  end
end

describe("the all words path", {:type => :feature}) do
  it("renders all of the inputted words and definitions") do
    visit("/")
    click_link("Your Dictionary")
    expect(page).to have_content("Banana")
  end
end
