require 'net/http'
require 'uri'
require 'json'

class Schedule
  def initialize

  end

  def programs
    uri = URI.parse('http://cal.syoboi.jp/rss2.php?alt=json')
    req = Net::HTTP.get(uri)
    JSON.parse(req)['items'].map do |data|
      next if data['Flag'] == '8'
      next unless ['3', '4', '5', '6', '7', '19'].include?(data['ChID'])
      next if data['StTime'].nil?
      Program.new(data['Title'], data['StTime'])
    end.compact
  end

  class Program
    attr_reader :title, :start_at

    def initialize(title, start_at)
      @title = title
      @start_at = Time.at(start_at.to_i)
    end
  end
end
