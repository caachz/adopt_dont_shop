require 'rails_helper'

RSpec.describe "A visitor can update pet information" do
  it "updates pet info" do

    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/pets/#{snickers.id}"

    expect(page).to have_link("Update Pet")

    click_link("Update Pet")

    expect(current_path).to eq("/pets/#{snickers.id}/edit")

    fill_in "Image", with: "https://images.halloweencostumes.com/products/46468/1-1/pet-jurassic-world-2-t-rex-costume.jpg"
    fill_in "Name", with: "Rex"
    fill_in "description", with: "Warm and Cuddly"
    fill_in "Age", with: "4"
    fill_in "sex", with: "Male"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(current_path).to eq("/pets/#{snickers.id}")

    expect(page).to have_content("Rex")
    expect(page).to have_content("4")
    expect(page).to have_content("Male")
    expect(page).to have_no_content("Snickers")
  end
end
