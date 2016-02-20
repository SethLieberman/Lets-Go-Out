class PlacesController < ApplicationController
	def new
	end

	def edit
	end

	def show
		client = Yelp::Client.new({ consumer_key: ENV['Y_CONSUMER_KEY'],
			consumer_secret: ENV['Y_CONSUMER_SECRET'],
			token: ENV['Y_TOKEN'],
			token_secret: ENV['Y_TOKEN_SECRET']
			})
		if params[:cuisine]
			query = params[:cuisine]
		else
			query = "food"

		end
		@results = client.search('Philadelphia', { term: query}, sort:[2], offset: 20)


	end

	def index

		
	end
end
