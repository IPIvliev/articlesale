# encoding: utf-8

class ArticleUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :resize_to_fill => [800, 440]

  version :thumb do
    process :resize_to_fill => [200, 150]
  end

end
