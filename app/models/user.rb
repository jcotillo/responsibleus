class User < ActiveRecord::Base
  has_many :customerships
  # this refers to clientele
  has_many :businesses, through: :customerships 
  # this refers to ownership 
  belongs_to :business 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
