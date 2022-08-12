50.times do |n|
  name = Faker::Avatar.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name, email: email, password: password,)
end