u1 = User.create(email: "alex@gmail.com", password: "123")
u2 = User.create(email: "test1@email.com", password: "123")
u3 = User.create(email: "test2@email.com", password: "123")
u4 = User.create(email: "test3@email.com", password: "123")
u5 = User.create(email: "test4@email.com", password: "345")


Post.create(content: Faker::Lorem.paragraph, number_of_likes: Faker::Number.number(digits= 2), user_id: 4)
Post.create(content: Faker::Lorem.paragraph, number_of_likes: Faker::Number.number(digits= 2), user_id: 5)
Post.create(content: Faker::Lorem.paragraph, number_of_likes: Faker::Number.number(digits= 2), user_id: 1)
Post.create(content: Faker::Lorem.paragraph, number_of_likes: Faker::Number.number(digits= 2), user_id: 3)
Post.create(content: Faker::Lorem.paragraph, number_of_likes: Faker::Number.number(digits= 2), user_id: 2)


10.times do
    Comment.create(content: Faker::Lorem.paragraph, post_id: Faker::Number.between(from= 1, to= Post.all.length), user_id: Faker::Number.between(from= 1, to= User.all.length))
end