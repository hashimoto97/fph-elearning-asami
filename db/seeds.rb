50.times do |n|
    User.create(
    name: Faker::Movies::HarryPotter.character,
    email: "rails#{n+1}@email.com",
    password: "password"
    )
end
