class Room < ApplicationRecord
	has_many :appointments
	has_many :users, :through => :appointments
	validates :name, presence: true, length: {minimum: 3, maximum: 50}
	validates :location, presence: true, length: {minimum: 3, maximum: 50}



	def self.search_by(date, time)
	  if date and time
	    Room.all - Room.joins(:appointments).where('appointment_date = ? AND start_time = ? AND status = 2', date, time)
	  else
	    Room.all
	  end
	end


end
