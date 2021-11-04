class HomeController < ApplicationController
  ##
   # As variaveis de instância @approved, @expired, @pendent recebem como resposta os valores retornados pelos métodos approved_appointments, expired_appointments, pendent_appointments.
   # Esses valores correspondem aos usuários que satifazem as operações de cada método chamado.

  def index
    @approved = approved_appointments
    @expired = expired_appointments
    @pendent = pendent_appointments
  end
  ##
   # Método criado para buscar reservas não expiradas e que foram aprovadas pelo administrador no o model appointment.A busca é realizada passando como argumento 
   # um appointment_data ASC, e retorna as reservas que se encaixam na descrição do método. Não possui nenhum efeito colateral.

  def approved_appointments

    Appointment.where(status: 2).order('appointment_date ASC')
  end

  ##
   # Método criado para buscar reservas não expiradas e que não foram aprovadas pelo administrador no o model appointment isso sem exeder o tempo de resposta. 
   # A busca é realizada passando como argumento um appointment_data ASC, e retorna as reservas que se encaixam na descrição do método. Não possui nenhum 
   # efeito colateral.


  def pendent_appointments

    Appointment.where(status: 1).order("appointment_date ASC")
  end

  ##
   # Método criado para buscar reservas já expiradas no model appointment. A busca é realizada passando como argumento um valor appointment_date e retorna todas as
   # as reservas que possuem datas inferiores ao dia atual. Não possui nenhum efeito colateral.

  def expired_appointments
    Appointment.where("appointment_date < ?", Date.today)
  end
end