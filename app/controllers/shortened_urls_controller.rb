class ShortenedUrlsController < ApplicationController
	def new
		@url = ShortenedUrl.new
		render :new
	end

	def create
		@url = ShortenedUrl.new(url_params)
		@url.short_url = ShortenedUrl.random_code
		if @url.save
			redirect_to shortened_urls_url
		else
			flash.now[:errors] = @url.errors.full_messages
			render :new
		end
	end

	def index
		@urls = ShortenedUrl.all
		render :index
	end

	private

	def url_params
		params.require(:url).permit(:long_url)
	end
end