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

  has_and_belongs_to_many :coupons

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable, :omniauth_providers => [:google_oauth2]

  def transportation_count
    total = events.length
    footprint = 0 
    events.each do |e| 
      if e.transportationschoice == "Car-alone" 
        footprint += 1 
      elsif e.transportationschoice == "Bus/Train" 
        footprint += 0.5
      elsif e.transportationschoice == "carpool" 
        footprint += 0.8  
      else
        footprint += 0
      end
    end

    environment = footprint/total

    if environment.between?(0, 0.2)
      return "good -- you get three coupons"
    elsif  environment.between?(0.20, 0.45)
      return "ok-- you get two coupons"
     elsif  environment.between?(0.45, 0.75)
      return "poor....improve by making greener choices! Here is a pity coupon"
    else
      return "no...just no."
    end
  end

end