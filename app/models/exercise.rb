class Exercise < ApplicationRecord
  has_many :exercises_plans
  has_many :plans, through: :exercises_plans

  validates :name, presence: true
end
