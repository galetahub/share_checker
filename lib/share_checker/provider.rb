require 'curb'
require 'crack'

module ShareChecker
  class Provider
    attr_reader :name
    
    def initialize(link, name = "noname", options = {})
      @link = link
      @name = name
      @options = options.symbolize_keys
    end
    
    def check
      response = self.class.get([url, @link].join)
      return nil unless response
      
      parse(response)
    end
    
    def parse(response)
      raise NotImplementedError, "Must be overwritten in subclasses"
    end
    
    def url
      raise NotImplementedError, "Must be overwritten in subclasses"
    end
    
    def parse_xml(body)
      begin
        content = Crack::XML.parse(body)
      rescue Exception => e
        puts "#{@name} error parse xml: #{body}, #{e.message}, #{@link}"
        content = nil
      end
      
      return content
    end
    
    def parse_json(body)
      begin
        content = Crack::JSON.parse(body)
      rescue Exception => e
        puts "#{@name} error parse xml: #{body}, #{e.message}, #{@link}"
        content = nil
      end
      
      return content
    end
    
    def method_missing(method_name, *args, &block)
      if @options.key?(method_name.to_sym)
        @options[method_name.to_sym]
      else
        super
      end
    end
    
    class << self
      def get(url)
        c = Curl::Easy.new(url) do |curl| 
          curl.headers["User-Agent"] = ShareChecker.config.user_agent
          curl.timeout = ShareChecker.config.timeout
          curl.verbose = false
          curl.follow_location = true
          curl.max_redirects = 2
        end

        c.perform
        c.body_str
      end
    end
  end
end
