require 'rails_helper'

RSpec.describe "A visitor can view all pets", type: :feature do
  it "has pets" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)
    sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Sadie', age: 3, sex: "Female", shelter: shelter2)

    visit "/pets"

    expect(page).to have_content(snickers.name)
    # expect(page).to have_content(snickers.image)
    expect(page).to have_content(snickers.age)
    expect(page).to have_content(snickers.sex)
    expect(page).to have_content(snickers.shelter.name)

    expect(page).to have_content(sadie.name)
    # expect(page).to have_content(sadie.image)
    expect(page).to have_content(sadie.age)
    expect(page).to have_content(sadie.sex)
    expect(page).to have_content(sadie.shelter.name)
  end
end
