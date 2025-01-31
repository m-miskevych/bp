class Exercise < ApplicationRecord
  extend Mobility
  translates :name, type: :string, fallbacks: { sk: :en }
  translates :description, type: :text, fallbacks: { sk: :en }

  has_many :exercises_plans
  has_many :plans, through: :exercises_plans

  validates :name, presence: true
  validates :description, presence: true
end
