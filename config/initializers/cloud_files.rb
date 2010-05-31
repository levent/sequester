CarrierWave.configure do |config|
  config.cloud_files_username = ENV['CLOUD_FILES_USERNAME'] || "xxxxxx"
  config.cloud_files_api_key = ENV['CLOUD_FILES_API_KEY'] || "xxxxxx"
  config.cloud_files_container = ENV['CLOUD_FILES_CONTAINER'] || "my_container"
end