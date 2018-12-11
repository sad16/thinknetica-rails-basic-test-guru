class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :results
  has_and_belongs_to_many :users
end
