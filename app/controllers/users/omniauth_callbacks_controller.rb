class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      p request.env["omniauth.auth"]
      # @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      # if @user.persisted?
      #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      #   sign_in_and_redirect @user, :event => :authentication
      # else
      #   session["devise.google_data"] = request.env["omniauth.auth"]
      #   redirect_to new_user_registration_url
      # end
  end

#   def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
#     data = access_token.info
#     user = User.where(:email => data["email"]).first

#     # Uncomment the section below if you want users to be created if they don't exist
#     # unless user
#     #     user = User.create(name: data["name"],
#     #        email: data["email"],
#     #        password: Devise.friendly_token[0,20]
#     #     )
#     # end
#     user
# end

  # def google_oauth2
  #   raise params.to_json
    # raise request.env["omniauth.auth"].to_json

    # #What data comes back from OmniAuth?   
    # puts '------------nnnnnnnnnnnnnnnnnnnnnnnnn---------------------'
    # puts params  
    # @auth = request.env["omniauth.auth"]
    # #Use the token from the data to request a list of calendars
    # puts @auth
    # @token = @auth["credentials"]["token"]
    # client = Google::APIClient.new
    # client.authorization.access_token = @token
    # service = client.discovered_api('calendar', 'v3')
    # @result = client.execute(
    #   :api_method => service.calendar_list.list,
    #   :parameters => {},
    #   :headers => {'Content-Type' => 'application/json'})
      # You need to implement the method below in your model (e.g. app/models/user.rb)
      # @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

      # if @user.persisted?
      #   flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      #   sign_in_and_redirect @user, :event => :authentication
      # else
      #   session["devise.google_data"] = request.env["omniauth.auth"]
      #   redirect_to new_user_registration_url
      # end
  # end
  # def google
  #   #What data comes back from OmniAuth?     
  #   @auth = request.env["omniauth.auth"]
  #   #Use the token from the data to request a list of calendars
  #   @token = @auth["credentials"]["token"]
  #   client = Google::APIClient.new
  #   client.authorization.access_token = @token
  #   service = client.discovered_api('calendar', 'v3')
  #   @result = client.execute(
  #     :api_method => service.calendar_list.list,
  #     :parameters => {},
  #     :headers => {'Content-Type' => 'application/json'})
  # end


  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when omniauth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
