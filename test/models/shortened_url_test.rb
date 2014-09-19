require 'test_helper'
class ShortenedUrlTest < ActiveSupport::TestCase
	test "should not save a url without long form" do
		url = ShortenedUrl.new
		assert_not url.save
	end
	test "should not save a url without a short form" do
		url = ShortenedUrl.new
		url.long_url = "https://www.google.com/"
		assert_not url.save
	end
	test "should save a properly created url" do
		url = ShortenedUrl.new
		url.long_url = "https://www.google.com"
		url.short_url = ShortenedUrl.random_code
		assert url.save
	end
end