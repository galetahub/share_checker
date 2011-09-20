require "spec_helper"

describe ShareChecker::Providers::Odnoklassniki do
  before(:each) do
    @provider = ShareChecker.provider("odnoklassniki", "http://www.google.com.ua/")
  end
  
  it "should parse response from odnoklassniki" do
    response = "ODKL.updateCount('odklcnt0','147');"
    @provider.parse(response).should == 147
  end
end
