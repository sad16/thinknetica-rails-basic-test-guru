class Test < ApplicationRecord
  MIN_LEVEL = 0

  LEVELS = {
    light: MIN_LEVEL..1,
    middle: 2..4,
    hard: 5..Float::INFINITY
  }.freeze

  TIMER = { min: 10, max: 360 }.freeze

  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :level, -> (level) { where(level: level) }
  scope :light, -> { level(LEVELS[:light]) }
  scope :middle, -> { level(LEVELS[:middle]) }
  scope :hard, -> { level(LEVELS[:hard]) }

  scope :category_title, -> (category_title) {
    joins(:category)
      .where(categories: { title: category_title })
      .order(title: :desc)
  }

  validates :title, presence: true,
                    uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: MIN_LEVEL }

  validates :timer, numericality: { allow_nil: true,
                                   only_integer: true,
                                   greater_than_or_equal_to: TIMER[:min],
                                   less_than_or_equal_to: TIMER[:max] }

  def self.titles_by_category_title(category_title)
    category_title(category_title).pluck(:title)
  end
end
