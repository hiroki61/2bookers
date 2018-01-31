class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :name,length: { in: 2..20 }
    validates :name,presence: true
    validates :intro,length: { maximum:50 }
    

    has_many :books
    attachment :profile_image


end
