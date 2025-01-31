class Plan < ApplicationRecord
  extend Mobility
  translates :name, type: :string, fallbacks: { sk: :en }
  translates :description, type: :text, fallbacks: { sk: :en }

  has_many :exercises_plans, dependent: :destroy
  has_many :exercises, through: :exercises_plans

  validates :name, presence: true
  validates :description, presence: true
end
