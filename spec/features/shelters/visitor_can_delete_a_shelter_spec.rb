require 'rails_helper'

RSpec.describe "A shelter can be delted", type: :feature do
  it "deletes a shelter" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    visit "/shelters/#{shelter1.id}"

    expect(page).to have_link("Delete Shelter")

    click_link("Delete Shelter")

    expect(current_path).to eq("/shelters")

    expect(page).to have_no_content('humane society')
  end
end
