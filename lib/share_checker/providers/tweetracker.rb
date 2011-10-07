require 'crack/json'

module ShareChecker
  module Providers
    class Tweetracker < Provider
      
      # Response sample
      #
      # {
      #   "tweets":30,
      #   "id":"4e281dcec546612414000004",
      #   "users":26,
      #   "query":"http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/140"
      # }
      #
      def parse(response)
        count = 0
        
        begin
          obj = Crack::JSON.parse(response)
          count = (obj["users"] ? obj["users"].to_i : 0)
        rescue Exception => e
          puts "Error parse json: #{response}, #{e.message}"
          count = 0
        end
        
        return count
      end
      
      def url
        "http://tracktweets.aimbulance.com/api/v1/groups/#{group_id}/urls/count.json?query="
      end
    end
  end
end
