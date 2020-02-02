require 'rails_helper'

RSpec.describe "A visitor can link to a shelters pets page from the shelter show page" do
  it "links shelters show page to shelters pets page" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link("#{shelter1.name}'s Available Pets")

    click_link("#{shelter1.name}'s Available Pets")

    expect(current_path).to eq("/shelters/#{shelter1.id}/pets")

    expect(page).to have_content("Snickers")
  end
end
