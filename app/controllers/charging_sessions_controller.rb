class ChargingSessionsController < ApplicationController
	before_action :find_session, only: :show

	def index
		@charging_sessions = ChargingSession.all 
		render json: @charging_sessions
	end

	def show
		render json: @charging_session.to_json(include: { client: { only: %i[name phone_number] },
		point: { only: :title} })
	end

	private

	def find_session
		@charging_session = ChargingSession.find(params[:id])
	end
end

# def show
#	  render json: @charging_session.to_json(include: { client: { only: %i[name phone_number] },
#	  connector: { include: [charging_station: { include: { point: { only: :title} } } ] } })
# end