require 'rails_helper'

RSpec.describe "A visitor can add a new pet to a shelter from the shelter index page" do
  it "adds a pet to a shelter" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter2)

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_link("Create Pet")

    click_link("Create Pet")

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets/new")

    fill_in "Image", with: "https://img.chewy.com/is/image/catalog/130621_MAIN._AC_SL1500_V1533919943_.jpg"
    fill_in "Name", with: "Bubbles"
    fill_in "Description", with: "part cute part adorable"
    fill_in "Age", with: "7"
    fill_in "sex", with: "male"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")

    expect(page).to have_content("Bubbles")
    expect(page).to have_content("7")
    expect(page).to have_content("male")
    expect(page).to have_no_content("Snickers")
  end
end
