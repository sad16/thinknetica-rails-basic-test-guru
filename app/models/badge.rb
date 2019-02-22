class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name,
            :image_url,
            :rule_name,
            :rule_value,
            presence: true

  enum rule_name: {
    category: 0,
    level: 1,
    attempt: 2
  }

  def self.assignable(test_passage)
    return unless test_passage.success_result?

    all.select { |badge| badge.assign?(test_passage) }
  end

  def assign?(test_passage)
    Badges::RuleServiceFactory.build(self, test_passage).call
  end
end
