require 'dotenv'
require 'twitter'

Dotenv.load('.env')

def login_twitter
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
    config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
    config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
    config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
  end
client
end

def last_25_hello_world_tweets_liker
  last_25_tweets = login_twitter.search("#bonjour_monde", result_type: "recent").take(25)
  login_twitter.favorite(last_25_tweets)
end

last_25_hello_world_tweets_liker