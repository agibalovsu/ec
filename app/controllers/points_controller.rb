class PointsController < ApplicationController	
	def index
		@points = Point.all
		render json: @points.to_json(include: [charging_stations: {include: :connectors}])
	end
end

