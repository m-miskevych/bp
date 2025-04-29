class SessionSlot < ApplicationRecord
  belongs_to :physiotherapist, class_name: "User"

  validates :name, :available_at, :duration, presence: true
end
