class Author < ApplicationRecord
  belongs_to :user
  has_many :tests
end
