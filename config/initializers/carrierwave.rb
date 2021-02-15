require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

# CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  # パブリックオブジェクトとしてアップロードするかどうか　falseでないとerrorになる
  config.fog_public = false
  # 有効期限を表すメタデータの付与
  config.fog_attributes = {'Cache-Control' => 'public, max-age=86400'}

  credentials = {
        provider: 'AWS',
        # IAMユーザー作成時のアクセスキーID、シークレットアクセスキー
        aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
        aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
        # :regionオプションはoptional Backetを作る際、Regionを指定した場合は、明示指定した方が良い
        region: 'ap-northeast-1',
        path_style: true,
  }
  case Rails.env
    when 'production'
      config.fog_credentials = credentials
      # 作成したバケット名
      config.fog_directory = 'suggests-production'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/suggests-production'

    when 'development'
      config.fog_credentials = credentials
      config.fog_directory = 'suggests-development'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/suggests-development'
    when 'test'
      # https://rexruby.wordpress.com/2018/07/30/mocking-carrierwavefog-for-tests/
      # keyはrails_helperのFog::Mockに設定したものと一致させる必要がある
      config.fog_provider = 'fog/aws'
      config.fog_credentials = {
        provider:              'AWS',
        aws_access_key_id:     'test',
        aws_secret_access_key: 'test',
        use_iam_profile:       false,
        region:                'us-east-1',
      }
      config.fog_directory  = 'test'
   end
end
