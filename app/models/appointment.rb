#Classe responsável pelo gerenciamento da model de reservas de sala
class Appointment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_presence_of :start_time
  validates_presence_of :appointment_date

end

