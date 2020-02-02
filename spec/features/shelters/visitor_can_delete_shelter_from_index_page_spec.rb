require 'rails_helper'

RSpec.describe "A visitor can delete a shelter from the shelter index page" do
  it "deletes a shelter from shelter index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    visit "/shelters"

    expect(page).to have_link("Delete Shelter", count: 2)

    click_link("Delete Shelter #{shelter1.name}")

    expect(current_path).to eq("/shelters")

    expect(page).to have_no_content("humane society")
    expect(page).to have_content("dogs love dinosaurs")
  end
end
