# coding: utf-8
module RoomsHelper
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
