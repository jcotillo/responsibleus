CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => ENV["s3_Access_Key_Id"],                        # required
    :aws_secret_access_key  => ENV["s3_Secret_Access_Key"]                         # required
  }
  config.fog_directory  = ENV["s3_Bucket_Name"]                     # required
  if Rails.env.production? 
  	config.cache_dir = "#{Rails.root}/tmp/uploads" # To let CarrierWave work on Heroku
  	config.storage = :fog
  else
  	config.storage = :file
  end

end
