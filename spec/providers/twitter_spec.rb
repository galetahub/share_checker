require "spec_helper"

describe ShareChecker::Providers::Twitter do
  before(:each) do
    @provider = ShareChecker.provider("twitter", "http://www.google.com.ua/")
  end
  
  it "should parse response from twitter" do
    response = 'twttr.receiveCount({"count":38,"url":"http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98/"})'
    @provider.parse(response).should == 38
  end
end
