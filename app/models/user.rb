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

  def transportation_count
    total = events.length
    footprint = 0 
    events do |e| 
      if e.transporationschoice == "Car" 
        footprint +=1 
      elsif e.transporationschoice == "Bicycle" 
        footprint +=0.3
      elsif e.transporationschoice == "Bus/Train" 
        footprint +=0.3
      else
        footprint += 0
      end
    end
    return footprint 
  end

end