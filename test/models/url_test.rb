require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  
  setup do
    srand 1
    @short_url = Url.shortener
  end

  test "generate short url with seven chars" do
    assert /^[a-z|\d]{7}$/.match(@short_url)
  end
  
  test "generate unique short url" do
    FactoryGirl.create :url, short: @short_url
    srand 1
    assert_not_equal Url.shortener, @short_url
  end
end
