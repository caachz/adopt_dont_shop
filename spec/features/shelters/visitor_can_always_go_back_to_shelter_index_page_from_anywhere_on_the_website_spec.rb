require 'rails_helper'

RSpec.describe "A visitor can click a link on any page to return them to the pets index page" do
  it "pets edit page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/pets/#{snickers.id}/edit"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "pets index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/pets"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "pets new page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/#{shelter1.id}/pets/new"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "shelter pets show page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/#{shelter1.id}/pets"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "pets show page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/pets/#{snickers.id}"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "shelters edit page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/#{shelter1.id}/edit"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "shelters index page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "shelters new page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/new"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end

  it "shelters show page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link("All Shelters")

    click_link("All Shelters")

    expect(current_path).to eq("/shelters")
  end
end
