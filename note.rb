require './schedule.rb'
require './tweet.rb'

schedule = Schedule.new
tweet = Tweet.new
schedule.programs.each do |program|
  text = "@yensaki #{program.start_at.strftime('%Y/%m/%d %H:%M')}: #{program.title}"
  tweet.tweet(text)
end