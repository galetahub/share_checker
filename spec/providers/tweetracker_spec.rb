require "spec_helper"

describe ShareChecker::Providers::Tweetracker do
  before(:each) do
    @provider = ShareChecker.provider("tweetracker", "http://www.google.com.ua/", :group_id => 'test')
  end
  
  it "should parse json response from tweetracker" do
    response = "{\"tweets\":30,\"id\":\"4e281dcec546612414000004\",\"users\":26,\"query\":\"http://www.mcdonaldseurokids2012.com.ua/challenges/1/works/140\"}"
    @provider.parse_json(response)["users"].should == 26
  end
  
  it "should parse xml response from tweetracker" do
    response = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<track-item>\n  <query>http://www.mcdonaldseurokids2012.com.ua/works/474</query>\n  <tweets type=\"integer\">1</tweets>\n  <users type=\"integer\">26</users>\n  <id>4e8f06abc546611f21000177</id>\n</track-item>\n"
    @provider.parse(response).should == 26
  end
end
