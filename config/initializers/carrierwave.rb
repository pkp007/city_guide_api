CarrierWave.configure do |config|
  if Rails.env.production?
 config.fog_credentials = {

# Configuration for Amazon S3 should be made available through an Environment variable.
# For local installations, export the env variable through the shell OR
# if using Passenger, set an Apache environment variable.
#
# In Heroku, follow http://devcenter.heroku.com/articles/config-vars
#
# $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

# Configuration for Amazon S3


provider: 'AWS',
aws_access_key_id: ENV[S3_KEY],
aws_secret_access_key: ENV[S3_SECRET],
region: ENV[S3_REGION]

 }
    config.fog_directory  = 'usar-s3'
 end



#end
#-------------------------------------------------Code For FTP Access------------
#  config.ftp_host = "50.87.248.83"
#  config.ftp_port = 21
#  config.ftp_user = "cityguide@aryahi.co"
#  config.ftp_passwd = "#Usar@2016"

#  config.ftp_folder = "/home1/aryahico/public_html/cityguide_photos"

#  config.ftp_url = "http://aryahi.co/cityguide_photos"
#  config.ftp_passive = false # false by default

end
