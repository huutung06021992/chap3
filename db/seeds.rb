User.create!(name:  "tung",
  email: "tung414@gmail.com",
  password: "0978446292",
  password_confirmation: "0978446292",
  admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password: password,
    password_confirmation: password)
end
