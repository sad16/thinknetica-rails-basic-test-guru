class Badge < ApplicationRecord
  has_many :user_badges
  has_many :users, through: :user_badges

  validates :name,
            :image_url,
            :rule_name,
            :rule_value,
            presence: true
end
