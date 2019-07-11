# Classe que registra o aluguel de uma sala,
# que pode ser feito por um usuário ou administrador,
# informando obrigatoriamente a data e horário do aluguel
class Appointment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_presence_of :start_time
  validates_presence_of :appointment_date
end
