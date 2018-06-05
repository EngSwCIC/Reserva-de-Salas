class Room < ApplicationRecord
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :location, presence: true, length: {minimum: 3, maximum: 50}
end
