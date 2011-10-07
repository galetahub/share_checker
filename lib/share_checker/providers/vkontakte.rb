require 'crack/json'

module ShareChecker
  module Providers
    class Vkontakte < Provider
      
      # Response sample
      #
      # {"response":{"count":1054,"users":[136685987,30523343,144263601,9428152,67880464,9770301,5702433,...]}}
      #
      def parse(response)
        obj = Crack::JSON.parse(response)
        obj["response"] ? obj["response"]["count"].to_i : 0
      end
      
      def url
        "https://api.vkontakte.ru/method/likes.getList?type=sitepage&owner_id=#{app_id}&page_url="
      end
    end
  end
end
