
##
# == Definição da classe *TodayAppointmentsController*.
# Responsável por identificar os alugueis do dia.
# Para isso, ocorre a formatação da data para forma ano/mes/dia, em que
# * ano representa os ultimos dois digitos do ano (ano % 100)
# * mes completado com zero para resultar dois digitos
# * dia completado com zero para resultar dois digitos
#
# Em seguida, a data é passada para a função _where_ para selecionar apenas alugueis do dia.
class TodayAppointmentsController < ApplicationController
  def index
    @day = Date.parse(DateTime.now.strftime("%y/%m/%d"))
    @appointments_today = Appointment.where(:appointment_date => @day.beginning_of_day .. @day.end_of_day)
  end
end
