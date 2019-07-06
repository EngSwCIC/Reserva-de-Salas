class Appointment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  resence_of :start_time
  validates_presence_of :appointment_date
end
