class Exercise < ApplicationRecord
  extend Mobility
  translates :name, type: :string, fallbacks: { sk: :en }
  translates :description, type: :text, fallbacks: { sk: :en }

  has_many :exercises_plans
  has_many :plans, through: :exercises_plans

  # has_many_attached :images
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 150, 150 ]
    attachable.variant :normal, resize_to_limit: [ 800, 800 ]
  end

  validates :name, presence: true
  validates :description, presence: true
end
