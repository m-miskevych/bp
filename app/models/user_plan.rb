class UserPlan < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  has_many :comments, dependent: :destroy

  validates :user_id, uniqueness: { scope: :plan_id, message: "už má tento plán priradený" }

  enum status: { draft: 0, in_progress: 1, done: 2 }

  # Scopes status
  scope :draft, -> { where(status: 0) }
  scope :in_progress, -> { where(status: 1) }
  scope :done, -> { where(status: 2) }
end
