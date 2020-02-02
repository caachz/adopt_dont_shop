require "rails_helper"

RSpec.describe "A shelters information can be updated", type: :feature do
  it "updates a shelter" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link("Update Shelter")

    click_link("Update Shelter")

    expect(current_path).to eq("/shelters/#{shelter1.id}/edit")

    fill_in "Name", with: "Dogs love Cats"
    fill_in "Address", with: "58205 st"
    fill_in "City", with: "New York"
    fill_in "State", with: "New York"
    fill_in "Zip", with: "48023"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter1.id}")

    expect(page).to have_content("Dogs love Cats")
    expect(page).to have_content("58205 st")
    expect(page).to have_content("New York")
    expect(page).to have_content("New York")
    expect(page).to have_content("48023")
  end
end
