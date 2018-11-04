class Room < ApplicationRecord
	has_many :appointments
	has_many :users, :through => :appointments
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :location, presence: true, length: {minimum: 3, maximum: 50}
	validates :tipo_sala, presence: true, length: {minimum: 3, maximum: 50}
end
