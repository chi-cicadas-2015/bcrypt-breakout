require 'faker'

15.times do |i|
  user = User.create!(name: Faker::Name.name,
               email: "myEmail#{i}@email.com",
               password: "123456")
  user.sayings.create!(text: Faker::Hacker.say_something_smart)
end

