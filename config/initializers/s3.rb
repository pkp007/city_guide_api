CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: 'AKIAIDREYTER5N445KYQ',
    aws_secret_access_key: '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',
    region: 'Singapore'
  }
  config.fog_directory  = 'usar-s3'
end
