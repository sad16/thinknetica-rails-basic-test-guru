class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name,
            :image_url,
            :rule_name,
            :rule_value,
            presence: true

  def self.assign(test_passage)
    return unless test_passage.success_result?

    user = test_passage.user

    all.each do |badge|
      user.badges << badge if badge.assign?(test_passage)
    end
  end

  def assign?(test_passage)
    Badges::RuleServiceFactory.build(self, test_passage).call
  end
end
