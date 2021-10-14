require 'rails_helper'

RSpec.describe AppointmentsController, type: :controller do
  # Leo
  it 'Estado aprovado persiste ao recarregar a página' do
    pending(':status_before_approved == :status_after_approved')
  end
  # Marquin
  it 'Estado reprovado persiste ao recarregar a página' do
    pending(':status_before_refused == :status_after_refused')
  end
end