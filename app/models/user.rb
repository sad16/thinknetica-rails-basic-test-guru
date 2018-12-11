class User < ApplicationRecord
  has_many :results
  has_and_belongs_to_many :tests
end
