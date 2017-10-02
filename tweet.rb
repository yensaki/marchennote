require 'twitter'

class Tweet
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['MARCHENNOTE_CONSUMERKEY']
      config.consumer_secret     = ENV['MARCHENNOTE_CONSUMER_SECRET']
      config.access_token        = ENV['MARCHENNOTE_ACCESS_TOKEN']
      config.access_token_secret = ENV['MARCHENNOTE_ACCESS_TOKEN_SECRET']
    end
  end

  def tweet(text)
    @client.update(text)
  end
end
