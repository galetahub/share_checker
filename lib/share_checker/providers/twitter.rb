module ShareChecker
  module Providers
    class Twitter < Provider
      
      # Response sample
      #
      # twttr.receiveCount({"count":38,"url":"http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98/"})
      #
      def parse(response)
        if response =~ /^twttr.receiveCount\((.+)\)$/i
          doc = parse_json($1)
          doc.nil? ? 0 : doc["count"].to_i
        end
      end
      
      def url
        "http://urls.api.twitter.com/1/urls/count.json?callback=twttr.receiveCount&url="
      end
    end
  end
end
