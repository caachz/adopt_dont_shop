require "rails_helper"

RSpec.describe "New shelter can be added", type: :feature do
  it "creates a new shelter" do

    visit "/shelters"

    expect(page).to have_link("New Shelter")

    click_link("New Shelter")

    expect(current_path).to eq("/shelters/new")

    fill_in "Name", with: "cats love dogs"
    fill_in "Address", with: "13459 st"
    fill_in "City", with: "San Diego"
    fill_in "State", with: "California"
    fill_in "Zip", with: "38290"

    expect(page).to have_button("Submit")

    click_on 'Submit'

    expect(current_path).to eq("/shelters")

    expect(page).to have_content("cats love dogs")
  end
end
