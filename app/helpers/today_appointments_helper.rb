##
# Módulo que contém funções auxiliares para os alugueis.

module TodayAppointmentsHelper
  ##
  # Retorna a sala do identificador dado   
  def get_room(id)
    Room.find(id)
  end
  
  ##
  # Retora usuário do identificador dado.
  def get_user(id)
    User.find(id)
  end
end
