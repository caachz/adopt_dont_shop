require "rails_helper"
RSpec.describe "shelters index page", type: :feature do
  it "shows all shelters" do
    shelter1 = Shelter.create!(name: 'humane society')
    shelter2 = Shelter.create(name: "Pound")
    shleter3 = Shelter.create(name: "Old Dogs Home")

    visit "/shelters"

    expect(page).to have_content(shelter1.name)
    expect(page).to have_content(shelter2.name)
    expect(page).to have_content(shleter3.name)
  end
end
