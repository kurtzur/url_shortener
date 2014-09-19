class ShortenedUrl < ActiveRecord::Base
	validates :long_url, :short_url, presence: true
	validates :short_url, uniqueness: true

	def self.random_code
		loop do
			random_code = SecureRandom.urlsafe_base64(5)
			return random_code unless ShortenedUrl.exists?(short_url: random_code)
		end
	end
end