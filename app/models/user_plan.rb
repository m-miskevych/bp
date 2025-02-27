class UserPlan < ApplicationRecord
  belongs_to :user
  belongs_to :plan

  validates :user_id, uniqueness: { scope: :plan_id, message: "už má tento plán priradený" }
end
