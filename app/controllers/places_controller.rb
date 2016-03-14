class PlacesController < ApplicationController
	def new
	end

	def edit
	end
	def create
		puts "MY PRAMS SETH ARE #{params}"
		

		p = Place.create(placename: params[:name], location: params[:location], google_place_id: params[:google_id], lat: params[:lat], lng: params[:lng] )
		@current_user.places.push(p)
		redirect_to root_path
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

	def search
		redirect_to :index
	end


	def index

		puts "HASHING is #{@hash}"

		@user = current_user
		@users = User.all

		@query = params[:search] || "restaurant"
		puts "PLACE IS #{@query}"

		client = Yelp::Client.new({ consumer_key: ENV['Y_CONSUMER_KEY'],
			consumer_secret: ENV['Y_CONSUMER_SECRET'],
			token: ENV['Y_TOKEN'],
			token_secret: ENV['Y_TOKEN_SECRET']
			})
		# if params[:cuisine]
		# 	query = params[:cuisine]
		# else
		# 	query = "restaurant"

		# end
		@results = client.search('Philadelphia', { term: @query}, sort:[2], offset:[20])

	end

	def destroy
		@user = User.find(current_user)
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to user_path(@user.id)
	end
end
