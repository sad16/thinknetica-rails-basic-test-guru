class Feedback < ApplicationRecord
  validates :email, :name, :message, presence: true
end
