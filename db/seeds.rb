# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# admin = Admin.create!(
#   last_name: "Admin",
#   first_name: "Admin",
#   email: "admin@admin.com",
#   password: "password",
#   password_confirmation: "password"
# )

# user = User.create!(
#   last_name: "User",
#   first_name: "User",
#   email: "user@user.com",
#   password: "password",
#   password_confirmation: "password"
# )

back, front = Category.create!([
  { title: "Backend" },
  { title: "Frontend" }
])

tests = admin.created_tests.create!([
  { title: "Ruby", level: 0, category: back },
  { title: "Rails", level: 1, category: back },
  { title: "HTML", level: 2, category: front },
  { title: "CSS", level: 3, category: front }
])

tests.each do |test|
  5.times do |index|
    question = test.questions.new(body: "Тело вопроса №#{index + 1} теста #{test.title}")
    4.times { |index| question.answers.new(body: "Тело ответа №#{index + 1}", correct: index.zero?) }
    question.save!
  end
end
