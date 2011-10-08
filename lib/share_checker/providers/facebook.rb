require 'nokogiri'

module ShareChecker
  module Providers
    class Facebook < Provider
      # Response sample
      #    
      # <links_getStats_response list="true">
      #  <link_stat>
      #    <url>http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98</url>
      #    <normalized_url>http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98</normalized_url>
      #    <share_count>36</share_count>
      #    <like_count>406</like_count>
      #    <comment_count>0</comment_count>
      #    <total_count>442</total_count>
      #    <click_count>0</click_count>
      #    <comments_fbid>10150218116270823</comments_fbid>
      #    <commentsbox_count>0</commentsbox_count>
      #  </link_stat>
      # </links_getStats_response>
      #
      def parse(response)
        doc = ::Nokogiri::XML(response)
        node = doc.at("like_count")
        node.nil? ? 0 : node.content.to_i
      end
      
      def url
        "http://api.facebook.com/restserver.php?method=links.getStats&urls="
      end
    end
  end
end
