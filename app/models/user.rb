class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { admin: 0, user: 1 }

  after_initialize :set_default_role, if: :new_record?

  # associations between admin (physio) and users (clients)
  has_many :users, class_name: "User", foreign_key: "admin_id", dependent: :nullify
  belongs_to :admin, class_name: "User", optional: true

  # Many-to-Many association between users and plans
  has_many :user_plans, dependent: :destroy
  has_many :plans, through: :user_plans

  has_many :comments, dependent: :destroy

  # session slots
  has_many :session_slots, foreign_key: :physiotherapist_id, dependent: :destroy

  has_many :appointments_as_client, class_name: "Appointment", foreign_key: :client_id, dependent: :destroy


  def set_default_role
    self.role ||= :admin
  end
end
