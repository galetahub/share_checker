require "spec_helper"

describe ShareChecker::Providers::Tweetracker do
  before(:each) do
    @provider = ShareChecker.provider("tweetracker", "http://www.google.com.ua/", :group_id => 'test')
  end
  
  it "should parse response from tweetracker" do
    response = "{\"tweets\":30,\"id\":\"4e281dcec546612414000004\",\"users\":26,\"query\":\"http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/140\"}"
    @provider.parse(response).should == 26
  end
end
