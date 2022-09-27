# encoding: utf-8

class ImgUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave 
  include CarrierWave::RMagick
end