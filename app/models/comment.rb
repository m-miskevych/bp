class Comment < ApplicationRecord
  belongs_to :user_plan
  belongs_to :user

  has_rich_text :body

  validates :body, presence: true
end
