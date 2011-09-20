module ShareChecker
  module Providers
    class Odnoklassniki < Provider
      
      # Response sample
      #
      # ODKL.updateCount('odklcnt0','147');
      #
      def parse(response)
        response =~ /\'(\d+)\'\)\;$/ ? $1.to_i : 0
      end
      
      def url
        "http://www.odnoklassniki.ru/dk?st.cmd=extLike&uid=odklcnt0&ref="
      end
    end
  end
end
