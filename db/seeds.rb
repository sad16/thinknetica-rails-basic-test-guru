# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: "User", email: "user@user.com", password: "password")

back, front = Category.create!([
  { title: "Backend" },
  { title: "Frontend" }
])

tests = user.created_tests.create!([
  { title: "Ruby", level: 0, category: back },
  { title: "Rails", level: 1, category: back },
  { title: "HTML", level: 2, category: front },
  { title: "CSS", level: 3, category: front }
])

tests.each do |test|
  5.times do |index|
    question = test.questions.new(body: "Тело вопроса №#{index} теста #{test.title}")
    4.times { |index| question.answers.new(body: "Тело ответа №#{index}", correct: index.zero?) }
    question.save!
  end
end

user.results.create!([
  { grade: 5, test: tests.first },
  { grade: 4, test: tests.last },
])
