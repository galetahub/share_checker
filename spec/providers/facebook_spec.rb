require "spec_helper"

describe ShareChecker::Providers::Facebook do
  before(:each) do
    @provider = ShareChecker.provider("facebook", "http://www.google.com.ua/")
  end
  
  it "should parse response from facebook" do
    response = '<links_getStats_response list="true">
      <link_stat>
          <url>http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98</url>
          <normalized_url>http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/98</normalized_url>
          <share_count>36</share_count>
          <like_count>406</like_count>
          <comment_count>0</comment_count>
          <total_count>442</total_count>
          <click_count>0</click_count>
          <comments_fbid>10150218116270823</comments_fbid>
          <commentsbox_count>0</commentsbox_count>
        </link_stat>
    </links_getStats_response>'
    
    @provider.parse(response).should == 406
  end
end
