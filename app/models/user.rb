class User < ActiveRecord::Base
  # validations
  validates :full_name, presence: true
  validates :zipcode, presence: true
  validates :transportation, presence: true
  mount_uploader :profilepic, ProfilePicUploader

  # this refers to ownership 
  has_many :customerships
  has_many :businesses, through: :customerships 
  belongs_to :business

  #private events
  has_many :events

  #refers to local events posted by businesses registered
  has_many :eventships 
  has_many :confirmedevents, through: :eventships, class_name: 'Event', source: :event


  has_and_belongs_to_many :coupons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :omniauth_providers => [:google_oauth2]

def green
  events.where('transportationschoice=? OR transportationschoice=?', "Walk", "Bicycle").length
end

def blue
  events.where('transportationschoice=? OR transportationschoice=? OR transportationschoice=? OR transportationschoice=?', "Carpool", "Bus", "Train", "Bus/Train").length
end

def red
  events.where('transportationschoice=?', "Car").length
end

  def transportation_count
    total = events.length
    footprint = 0 
    events.each do |e| 
      if e.transportationschoice == "Car" 
        footprint += 1 
      elsif e.transportationschoice == "Bus/Train" 
        footprint += 0.5
      elsif e.transportationschoice == "Carpool" 
        footprint += 0.8  
      else
        footprint += 0
      end
    end

    if total == 0
      return "0"
    end

    environment = footprint/total if total > 0

    if environment.between?(0, 0.2)
      return "3"
    elsif  environment.between?(0.20, 0.45)
      return "2"
     elsif  environment.between?(0.45, 0.75)
      return "1"
    else
      return "1"
    end
  end

end