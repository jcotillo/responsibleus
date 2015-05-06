Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '219359876437-a4vk89ojhbj5ssj2kff6lsbluv2mije2.apps.googleusercontent.com', 'XMZJ8500m1wgqLA38txnuZdO',
  	{
      :name => "google",
      :scope => "email, profile, plus.me, calendar",
      # :redirect_uri =>'http://localhost:3000/auth/google_oauth2/callback',
      :prompt => "select_account",
      :image_aspect_ratio => "square",
      :image_size => 50
    }

    # access_type: 'offline',
    # scope: 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/calendar',
    # redirect_uri:'http://localhost:3000/auth/google_oauth2/callback'
 end