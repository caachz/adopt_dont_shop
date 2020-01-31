require "rails_helper"

RSpec.describe "shelters index page", type: :feature do
  it "shows all shelters" do
    shelter1 = Shelter.create(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create(name: "Pound", address: "5678 st", city: 'Seattle', state: 'Washington', zip: "390507")
    shleter3 = Shelter.create(name: "Old Dogs Home", address: '2948 st', city: 'San Diego', state: 'California', zip: "30958")

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shleter3.name)
  end
end
