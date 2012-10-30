require 'twitter'

twitter_config = YAML.load(File.read(Rails.root.join('config', 'twitter.yml')))[Rails.env]

Twitter.configure do |config|
  config.consumer_key = 'aXVhTIHfXgFvw8bE7F3A'
  config.consumer_secret = 'uFaxDHGEfmvt7IKJtnHsM1adui3zmwC818kEd18cEKI'
  config.oauth_token = twitter_config['oauth_token']
  config.oauth_token_secret = twitter_config['oauth_token_secret']
end
