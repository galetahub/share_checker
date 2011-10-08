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
        doc = parse_json(response)
        doc.nil? ? 0 : doc["users"].to_i
      end
      
      def url
        "http://tracktweets.aimbulance.com/api/v1/groups/#{group_id}/urls/count.json?query="
      end
    end
  end
end
