class Test < ApplicationRecord
  belongs_to :author
  belongs_to :category
  has_many :questions
  has_many :results
  has_many :users, through: :results

  def self.titles(category_title)
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
      .pluck(:title)
  end
end
