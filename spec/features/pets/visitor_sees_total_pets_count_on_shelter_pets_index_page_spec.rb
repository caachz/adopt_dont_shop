require 'rails_helper'

RSpec.describe "A visitor can see the total pet count at the top of every shelter pets index page" do
  it "gets a total pet count" do
    shelter1 = Shelter.create!(name: 'humane society', address: "1234 st", city: 'Denver', state: 'Colorado', zip: "29572")

    snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Snickers', age: 15, sex: 'Female', shelter: shelter1)
    abbey = Pet.create!(image: 'https://www.rd.com/wp-content/uploads/2019/09/01_Doggie-dino-760x506.jpg', name: 'Abbey', age: 4, sex: 'Female', shelter: shelter1)
    sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Sadie', age: 3, sex: "Female", shelter: shelter1)

    visit "shelters/#{shelter1.id}/pets"

    expect(page).to have_content("3")
  end
end
