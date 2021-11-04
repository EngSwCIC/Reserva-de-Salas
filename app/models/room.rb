# Classe que declara uma sala disponível para aluguel
# cadastrada com os dados "nome", "capacidade" e "local"
class Room < ApplicationRecord
	has_many :appointments
	has_many :users, :through => :appointments
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :location, presence: true, length: {minimum: 3, maximum: 50}
	validates :students, presence: true
end
