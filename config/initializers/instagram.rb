require 'instagram'

instagram_config = YAML.load(File.read(Rails.root.join('config', 'instagram.yml')))

if Rails.env.development?
  INSTAGRAM_CALLBACK_URL = "http://localhost:3000#{instagram_config['url']}"
elsif Rails.env.production?
  INSTAGRAM_CALLBACK_URL = `hostname` + instagram_config['url']
end

Instagram.configure do |config|
  config.client_id = instagram_config['id']
  config.client_secret = instagram_config['secret']
end
