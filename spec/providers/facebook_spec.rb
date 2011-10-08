require "spec_helper"

describe ShareChecker::Providers::Facebook do
  before(:each) do
    @provider = ShareChecker.provider("facebook", "http://www.google.com.ua/")
  end
  
  it "should parse response from facebook" do
    response = '<links_getStats_response xsi:schemaLocation="http://api.facebook.com/1.0/ http://api.facebook.com/1.0/facebook.xsd" list="true"><link_stat><url>http://www.mcdonaldseurokids2012.com.ua/works/570</url><normalized_url>http://www.mcdonaldseurokids2012.com.ua/works/570</normalized_url><share_count>0</share_count><like_count>16</like_count><comment_count>0</comment_count><total_count>16</total_count><click_count>0</click_count><comments_fbid>10150408802277464</comments_fbid><commentsbox_count>0</commentsbox_count></link_stat></links_getStats_response>'
    
    @provider.parse(response).should == 16
  end
end
