# coding: utf-8

##
# Módulo com funções auxiliares para manipular salas.
module RoomsHelper
  ##
  # Retorna uma string personalizada para cada caso da status. Retornos:
  # * status == 1 : "Aguardando confirmação"
  # * status == 2 : "Confirmada"
  # * status == 3 : "Rejeitada"
  # * outros : "Ainvalid status identifier (status)"  
  def get_status_string(status)
    if status.to_i == 1
      return "Aguardando confirmação"
    elsif status.to_i == 2
      return "Confirmada"
    elsif status.to_i == 3
      return "Rejeitada"
    else raise "invalid status identifier " + status.to_i.to_s
    end
  end
end
