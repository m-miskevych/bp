class Appointment < ApplicationRecord
  belongs_to :client, class_name: "User"
  belongs_to :session_slot

  enum status: { pending: 0, approved: 1, rejected: 2 }

  validates :start_at, :end_at, :session_slot_id, presence: true
  validates :session_slot_id, uniqueness: { scope: :client_id, message: "has already been booked by you" }
end
