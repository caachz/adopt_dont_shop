require 'rails_helper'

RSpec.describe "A vistor can view all the pets that belong to a given shelter" do
  it "lists all pets in a shelter" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)
    abbey = Pet.create!(image: 'https://www.rd.com/wp-content/uploads/2019/09/01_Doggie-dino-760x506.jpg', name: 'Abbey', age: 4, sex: 'Female', shelter: shelter1)
    sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Sadie', age: 3, sex: "Female", shelter: shelter2)

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_content(snickers.name)
    # expect(page).to have_content(snickers.image)
    expect(page).to have_content(snickers.age)
    expect(page).to have_content(snickers.sex)
    expect(page).to have_content(snickers.shelter.name)

    expect(page).to have_content(abbey.name)
    # expect(page).to have_content(abbey.image)
    expect(page).to have_content(abbey.age)
    expect(page).to have_content(abbey.sex)
    expect(page).to have_content(abbey.shelter.name)

    visit "/shelters/#{shelter2.id}/pets"

    expect(page).to have_content(sadie.name)
    # expect(page).to have_content(sadie.image)
    expect(page).to have_content(sadie.age)
    expect(page).to have_content(sadie.sex)
    expect(page).to have_content(sadie.shelter.name)
  end
end
