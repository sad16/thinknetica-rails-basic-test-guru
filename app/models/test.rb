class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_and_belongs_to_many :users

  def self.titles(category_title)
    joins(:category)
      .where("categories.title = :category_title", category_title: category_title)
      .order("tests.title")
      .pluck("tests.title")
  end
end
