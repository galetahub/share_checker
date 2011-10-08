require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/object'
require 'active_support/core_ext/string'

module ShareChecker
  autoload :Provider, 'share_checker/provider'
  autoload :Config, 'share_checker/config'
  
  module Providers
    autoload :Facebook, 'share_checker/providers/facebook'
    autoload :Twitter, 'share_checker/providers/twitter'
    autoload :Vkontakte, 'share_checker/providers/vkontakte'
    autoload :Odnoklassniki, 'share_checker/providers/odnoklassniki'
    autoload :Tweetracker, 'share_checker/providers/tweetracker'
    
    def self.get(provider)
      "ShareChecker::Providers::#{provider.to_s.classify}".constantize
    end
    
    def self.avariable
      constants.select {|c| Class === const_get(c)}.sort.map(&:downcase).map(&:to_sym)
    end
  end
  
  mattr_accessor :config
  @@config = Config.new
  
  # Class methods
  
  def self.setup(&block)
    yield config
  end
  
  def self.check(*args)
    provider(*args).check
  end
  
  def self.provider(provider, url, options = {})
    options = (config.send(provider) || {}).merge(options)
    Providers.get(provider).new(url, provider, options)
  end
end
