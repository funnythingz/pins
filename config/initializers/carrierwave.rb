if Rails.env.production?
  CarrierWave.configure do |config|
    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
