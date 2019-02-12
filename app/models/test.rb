class Test < ApplicationRecord
  MIN_LEVEL = 0
  LEVELS = {
    light: MIN_LEVEL..1,
    middle: 2..4,
    hard: 5..Float::INFINITY
  }.freeze

  belongs_to :category
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :nullify
  has_many :users, through: :test_passages

  scope :level, -> (level) { where(level: level) }
  scope :light, -> { level(LEVELS[:light]) }
  scope :middle, -> { level(LEVELS[:middle]) }
  scope :hard, -> { level(LEVELS[:hard]) }

  scope :by_category, -> (category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: MIN_LEVEL }

  def self.titles_by_category(category)
    by_category(category).pluck(:title)
  end
end
