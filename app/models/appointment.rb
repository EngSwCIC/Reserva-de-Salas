class Appointment < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates_presence_of :start_time
  validates_presence_of :appointment_date

  #Método de busca de registros da tabela de reservas que estão marcadas para datas entre o início da semana e o fim da semana
  def self.week_appoint
    Appointment.where('appointment_date BETWEEN ? AND ?', Date.today.beginning_of_week, Date.today.end_of_week).sort_by &:appointment_date
  end

end

