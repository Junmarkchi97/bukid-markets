Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDNAME']
  config.api_key = ENV['CLOUDAPIKEY']
  config.api_secret = ENV['CLOUDINARYSECRET']
  config.secure = true
end