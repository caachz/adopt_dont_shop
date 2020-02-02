require 'rails_helper'

RSpec.describe "A visitor can click on the shelters name at any point and be brought to that shelters show page" do
  it "shelters pets show index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "shelters/#{shelter1.id}/pets"

    expect(page).to have_link("#{shelter1.name}")

    click_link("#{shelter1.name}")

    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end

  it "pets show page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "pets/#{snickers.id}"

    expect(page).to have_link("#{shelter1.name}")

    click_link("#{shelter1.name}")

    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end

  it "pets index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/pets"

    expect(page).to have_link("#{shelter1.name}")

    click_link("#{shelter1.name}")

    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end

  it "shelters index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "shelters/"

    expect(page).to have_link("#{shelter1.name}")

    click_link("#{shelter1.name}")

    expect(current_path).to eq("/shelters/#{shelter1.id}")
  end
end
