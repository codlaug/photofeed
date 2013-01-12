require 'instagram'

instagram_config = YAML.load(File.read(Rails.root.join('config', 'instagram.yml')))

INSTAGRAM_CALLBACK_URL = instagram_config['url']

Instagram.configure do |config|
  config.client_id = instagram_config['id']
  config.client_secret = instagram_config['secret']
end
