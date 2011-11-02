require 'spec_helper'

describe ShareChecker do
  it "should be valid" do
    ShareChecker.should be_a(Module)
  end
  
  context "providers" do
    it "should return provider class" do
      ShareChecker::Providers.get("facebook").should == ShareChecker::Providers::Facebook
      ShareChecker::Providers.get("twitter").should == ShareChecker::Providers::Twitter
    end
    
    it "should return full list of avariable providers" do
      ShareChecker::Providers.avariable.should == [:facebook, :odnoklassniki, :tweetracker, :twitter, :vkontakte]
    end
    
    it "should get google search page" do
      body = ShareChecker::Provider.get("http://www.google.com/")
      body.should include("<title>Google</title>")
    end
  end
  
  context "setup" do
    before(:each) do
      ShareChecker.setup do |config|
        config.vkontakte = { :app_id => 123456 } 
        config.facebook = { :some_param => 'test' }
      end
    end
    
    it "should set provider options" do
      ShareChecker.provider("vkontakte", "test").app_id.should == 123456
      ShareChecker.provider("facebook", "test").some_param.should == 'test'
    end
    
    it "should overwritte default options" do
      ShareChecker.provider("vkontakte", "test", :app_id => 'new_app').app_id.should == 'new_app'
    end
    
    it "should raise error on not exists option" do
      lambda {
        ShareChecker.provider("vkontakte", "test").some_param
      }.should raise_error(StandardError)
    end
  end
end
