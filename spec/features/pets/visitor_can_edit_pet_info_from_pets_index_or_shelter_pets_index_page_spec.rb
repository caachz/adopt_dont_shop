require 'rails_helper'

RSpec.describe "A visitor can edit a pet from either the pet index page or the shelter pet index page" do
  it "edits pet info from pet index" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)
    sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Sadie', age: 3, sex: "Female", shelter: shelter2)
    abbey = Pet.create!(image: 'https://petcostumecenter.com/wp-content/uploads/2019/08/Pupasaurus-Rex-T-Rex-Dog-Cat-Costume-.png', name: 'Abbey', age: 6, sex: "Male", shelter: shelter2)

    visit "/pets"

    expect(page).to have_link("Edit Pet", count: 3)

    click_link("Edit Pet #{snickers.name}")

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

  it "edits pet info from shelters pet index" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")
    shelter2 = Shelter.create!(name: 'dogs love dinosaurs', address: "5678 st", city: 'Seattle', state: 'Washington', zip: "64325")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)
    sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Sadie', age: 3, sex: "Female", shelter: shelter2)
    abbey = Pet.create!(image: 'https://petcostumecenter.com/wp-content/uploads/2019/08/Pupasaurus-Rex-T-Rex-Dog-Cat-Costume-.png', name: 'Abbey', age: 6, sex: "Male", shelter: shelter2)

    visit "shelters/#{shelter2.id}/pets"

    expect(page).to have_link("Edit Pet", count: 2)

    click_link("Edit Pet #{sadie.name}")

    expect(current_path).to eq("/pets/#{sadie.id}/edit")

    fill_in "Image", with: "https://images.halloweencostumes.com/products/46468/1-1/pet-jurassic-world-2-t-rex-costume.jpg"
    fill_in "Name", with: "Rex"
    fill_in "description", with: "Warm and Cuddly"
    fill_in "Age", with: "4"
    fill_in "sex", with: "Male"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(current_path).to eq("/pets/#{sadie.id}")

    expect(page).to have_content("Rex")
    expect(page).to have_content("4")
    expect(page).to have_content("Male")
    expect(page).to have_no_content("Sadie")
  end
end
