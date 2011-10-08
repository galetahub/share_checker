module ShareChecker
  module Providers
    class Vkontakte < Provider
      
      # Response sample
      #
      # {"response":{"count":1054,"users":[136685987,30523343,144263601,9428152,67880464,9770301,5702433,...]}}
      #
      def parse(response)
        doc = parse_json(response)
        doc.nil? ? 0 : doc["response"]["count"].to_i
      end
      
      def url
        "https://api.vkontakte.ru/method/likes.getList?type=sitepage&owner_id=#{app_id}&page_url="
      end
    end
  end
end
