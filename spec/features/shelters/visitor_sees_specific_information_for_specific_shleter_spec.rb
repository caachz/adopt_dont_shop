require "rails_helper"

RSpec.describe "Shelter ID displays all shelter info", type: :feature do
  it "shows all info for specific shelter" do
    shelter1 = Shelter.create(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create(name: "Pound", address: "5678 st", city: 'Seattle', state: 'Washington', zip: "390507")
    shleter3 = Shelter.create(name: "Old Dogs Home", address: '2948 st', city: 'San Diego', state: 'California', zip: "30958")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter1.address)
    expect(page).to have_content(shelter1.city)
    expect(page).to have_content(shelter1.state)
    expect(page).to have_content(shelter1.zip)

    visit "/shelters/#{shelter2.id}"

    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shelter2.address)
    expect(page).to have_content(shelter2.city)
    expect(page).to have_content(shelter2.state)
    expect(page).to have_content(shelter2.zip)

    visit "/shelters/#{shleter3.id}"

    expect(page).to have_content(shleter3.name)
    expect(page).to have_content(shleter3.address)
    expect(page).to have_content(shleter3.city)
    expect(page).to have_content(shleter3.state)
    expect(page).to have_content(shleter3.zip)
  end
end
