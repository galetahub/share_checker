require "spec_helper"

describe ShareChecker::Providers::Vkontakte do
  before(:each) do
    @provider = ShareChecker.provider("vkontakte", "http://www.google.com.ua/", :app_id => 2349130)
  end
  
  it "should parse response from vkontakte" do
    response = '{"response":{"count":1054,"users":[136685987,30523343,144263601,9428152,67880464,9770301,5702433]}}'
    @provider.parse(response).should == 1054
  end
end
