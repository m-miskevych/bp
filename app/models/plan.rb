class Plan < ApplicationRecord
  has_many :exercises_plans, dependent: :destroy
  has_many :exercises, through: :exercises_plans
end
