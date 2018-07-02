class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :appointments
  has_many :rooms, :through => :appointments
  
  validates :username, :course, :registration, :presence => true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def is_admin?
  	self.is_admin
  end
end
