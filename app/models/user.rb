class User < ActiveRecord::Base
  # validations
  validates :full_name, presence: true
  validates :neighborhood, presence: true
  validates :transportation, presence: true

  has_many :customerships
  # this refers to clientele
  has_many :businesses, through: :customerships 
  # this refers to ownership 
  belongs_to :business

  # has many events 
  has_many :events 
  has_many :confirmed_events, through: :events, class_name: 'Business', source: :business
  mount_uploader :profilepic, ProfilePicUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
