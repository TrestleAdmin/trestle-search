require "rails_helper"

feature "Basic search" do
  CONTINENTS = ["North America", "South America", "Antarctica", "Europe", "Asia", "Africa", "Australia"]

  before(:each) do
    Continent.create(CONTINENTS.map { |c| { name: c } })
  end

  scenario "accessing regular index" do
    visit "/admin/continents"

    expect(page).to have_content("Displaying all 7 Continents")

    CONTINENTS.each do |continent|
      expect(page).to have_content(continent)
    end
  end

  scenario "searching with results" do
    search_for("america")

    expect(page).to have_content("Displaying all 2 Continents")

    within(".breadcrumb") do
      expect(page).to have_content("Search Results")
    end

    expect(page).to have_content("North America")
    expect(page).to have_content("South America")

    expect(page).not_to have_content("Antarctica")
    expect(page).not_to have_content("Europe")
    expect(page).not_to have_content("Asia")
    expect(page).not_to have_content("Africa")
    expect(page).not_to have_content("Australia")
  end

  scenario "searching with no results" do
    search_for("notacontinent")

    expect(page).to have_content("No Continents found")

    within(".breadcrumb") do
      expect(page).to have_content("Search Results")
    end

    CONTINENTS.each do |continent|
      expect(page).not_to have_content(continent)
    end
  end

private
  def search_for(query)
    visit "/admin/continents"
    fill_in "Search", with: query

    form = page.find("#q").ancestor("form")
    Capybara::RackTest::Form.new(page.driver, form.native).submit({})
  end
end
