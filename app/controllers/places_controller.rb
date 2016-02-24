class PlacesController < ApplicationController
	def new
	end

	def edit
	end

	def show

	end

	def place_search
		# set up search for places on yelp
		# this needs to pass the queary from above

	end

	def follow_place
		# when user clicks add place to user page
	end


	def index
		@hash = Gmaps4rails.build_markers(@users) do |user, marker|
			marker.lat user.latitude
			marker.lng user.longitude
		end

		@user = current_user
		@users = User.all

		client = Yelp::Client.new({ consumer_key: ENV['Y_CONSUMER_KEY'],
			consumer_secret: ENV['Y_CONSUMER_SECRET'],
			token: ENV['Y_TOKEN'],
			token_secret: ENV['Y_TOKEN_SECRET']
			})
		if params[:cuisine]
			query = params[:cuisine]
		else
			query = "restaurant"

		end
		@results = client.search('Philadelphia', { term: query}, sort:[2], offset:[20])

	end
end
