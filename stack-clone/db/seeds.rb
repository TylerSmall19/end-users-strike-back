# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do
  User.create(
    username: Faker::Internet.user_name,
    name: Faker::Name.first_name,
    password: "password"
  )
end

35.times do
  u = User.all.sample
  u.questions.create(
    question: Faker::Lorem.paragraph,
    title: Faker::Lorem.sentence
  )
end

200.times do
  u = User.all.sample
  q = Question.all.sample
  u.answers.create(
    question: q,
    body: Faker::Lorem.paragraph
  )
end

User.all.each do |u|
  Question.all.each do |q|
    q.votes.create(
      voter: u,
      up_vote: [true, false].sample
    )
  end
end
