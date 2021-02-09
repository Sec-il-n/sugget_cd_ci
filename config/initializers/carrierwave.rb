require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  # config.fog_directory = 'suggests-development'
  config.fog_credentials = {
        provider: 'AWS',
        # IAMユーザー作成時のアクセスキーID、シークレットアクセスキー
        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        region: 'ap-northeast-1',
        path_style: true,
  }
  # パブリックオブジェクトとしてアップロードするかどうか　falseでないとerrorになる
  config.fog_public = false
  # 有効期限を表すメタデータの付与
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  case Rails.env
    when 'production'
      # 作成したバケット名
      config.fog_directory = 'suggests-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/suggests-production'
    when 'development'
      config.fog_directory = 'suggests-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/suggests-development'
  end
end
