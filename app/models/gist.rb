class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question

  validates :url, presence: true

  def text_id
    url.split('/').last
  end
end
