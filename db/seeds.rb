# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

back, front = Category.create([
  { title: "Backend" },
  { title: "Frontend" }
])

tests = Test.create([
  { title: "Ruby", level: 0, category: back },
  { title: "Rails", level: 1, category: back },
  { title: "HTML", level: 2, category: front },
  { title: "CSS", level: 3, category: front }
])

tests.each do |test|
  5.times do |index|
    question = test.questions.create(body: "Тело вопроса №#{index} теста #{test.title}")
    4.times { |index| question.answers.create(body: "Тело ответа №#{index}", correct: index.zero?) }
  end
end

user = User.create(name: "User", email: "user@user.com", password: "password")
user.tests << tests.first(2)

tests.first.results.create(grade: 5, user: user)
