require 'nokogiri'

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
      # or
      #  <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<track-item>\n  <query>http://www.mcdonaldseurokids2012.com.ua/works/474</query>\n  <tweets type=\"integer\">1</tweets>\n  <users type=\"integer\">1</users>\n  <id>4e8f06abc546611f21000177</id>\n</track-item>\n
      
      def parse(response)
        doc = ::Nokogiri::XML(response)
        node = doc.at("users")
        node.nil? ? 0 : node.content.to_i
      end
      
      def url
        "http://tracktweets.aimbulance.com/api/v1/groups/#{group_id}/urls/count.xml?query="
      end
    end
  end
end
