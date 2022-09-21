# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
users = [
  { email: 'junmarkchi97@gmail.com', first_name: 'Junmark', last_name: 'Chi', seller: true, bio: "test" },
  { email: 'chijunmark97@gmail.com', first_name: 'James', last_name: 'Bond', seller: false, bio: "test1" },
]

users.each do |user|
  this_user = User.where(email: user[:email], ).first_or_initialize

  this_user.update!( first_name: user[:first_name], last_name: user[:last_name], seller: user[:seller], bio: user[:bio], password: SecureRandom.uuid, )
  this_user.save
end