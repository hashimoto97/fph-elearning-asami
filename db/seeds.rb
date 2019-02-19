User.create!(name: "bb",
            email: "bb@email.com",
            password: "password",
            admin: true)

50.times do |n|
    User.create(
    name: Faker::Movies::HarryPotter.character,
    email: "rails#{n+1}@email.com",
    password: "password"
    )
end

30.times do |a|
    Category.create!(
    title: Faker::Science.element,
    )
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
