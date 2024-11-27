class Plan < ApplicationRecord
  has_many :exercises_plans
  has_many :exercises, through: :exercises_plans
end
