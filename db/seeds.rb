# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shelter1 = Shelter.create!(name: 'Mike\'s Shelter,', address: "1331 17th Street", city: 'Denver', state: 'CO', zip: "80202")
shelter2 = Shelter.create!(name: 'Meg\'s Shelter', address: "150 Main Street", city: 'Hershey', state: 'PA', zip: "17033")

snickers = Pet.create!(image: 'https://images-na.ssl-images-amazon.com/images/I/41Q-6cQEOLL._AC_SY400_.jpg', name: 'Athena', age: 1, sex: 'female', shelter: shelter1, description: 'butthead', adoption_status: "Pending Adoption")
sadie = Pet.create!(image: 'https://images.halloweencostumes.com/products/45834/1-1/dog-dino-pup-costume.jpg', name: 'Odell', age: 4, sex: "M", shelter: shelter2, description: 'good dog', adoption_status: "Adoptable")
