CarrierWave.configure do |config|

  config.fog_directory   = 'companiesandcontacts'
  config.fog_public      = false
  config.storage         = :fog
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["aws_access_key_id"],
      aws_secret_access_key: ENV["aws_secret_access_key"],
      region:                'ap-southeast-2'
  }
end