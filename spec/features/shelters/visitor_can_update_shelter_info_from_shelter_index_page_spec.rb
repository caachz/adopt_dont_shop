require "rails_helper"

RSpec.describe "A visitor can update shelter information from the shelter index page" do
  it "updates shelter info" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    visit "/shelters"

    expect(page).to have_link("Edit Shelter", count: 2)

    click_link("Edit Shelter #{shelter1.name}")

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in "name", with: "Adopt a top"
    fill_in "address", with: "58205 st"
    fill_in "city", with: "Boston"
    fill_in "state", with: "New York"
    fill_in "zip", with: "48023"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    expect(page).to have_content("Adopt a top")
    expect(page).to have_content("58205 st")
    expect(page).to have_content("Boston")
    expect(page).to have_content("New York")
    expect(page).to have_content("48023")
  end
end
