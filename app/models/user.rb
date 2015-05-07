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
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
      data = access_token.info
      user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
      if user
        return user
      else
        registered_user = User.where(:email => access_token.info.email).first
        if registered_user
          return registered_user
        else
          user = User.create(name: data["name"],
            provider:access_token.provider,
            email: data["email"],
            uid: access_token.uid ,
            password: Devise.friendly_token[0,20],
          )
        end
     end
    end
end