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

categories = Category.order(created_at: :desc).take(5)

categories.each do |category|
  5.times do
    content = Faker::Lorem.unique.word
    word = category.words.build(content: content)

    nth = rand(0..2)

    3.times do |i|
      if i == nth
        word.choices.build(content: content, correct: true)
      else
        word.choices.build(content: Faker::Lorem.word)
      end
    end

    word.save!
  end
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
