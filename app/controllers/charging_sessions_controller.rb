class ChargingSessionsController < ApplicationController
	before_action :find_session, only: %i[show stop]
 
	def index
		@charging_sessions = ChargingSession.all
		respond_to do |format|
	    format.html  
	    format.json  { render json: @charging_sessions }
	  end
		@charging_session = ChargingSession.new
	end

	def show
		respond_to do |format|
	    format.html  # show.html.slim
	    format.json  { 
	    	render json: @charging_session.to_json(include: { client: { only: %i[name phone_number] },
				connector: { include: [charging_station: { include: { point: { only: :title} } } ] } }) 
	    }
	  end
		# еcли создать ассоциацию с моделью point
		# render json: @charging_session.to_json(include: { client: { only: %i[name phone_number] },
		# point: { only: :title} })
	end

	def create
		@charging_session = ChargingSession.new(charging_session_params)

    if @charging_session.save!
    	respond_to do |format|
	    	format.html  
	    	format.json  { render json: @charging_session.to_json(include: { connector: { only: %i[condition] } }) }
	  	end
    	redirect_to charging_session_path(@charging_session)
    else
    	redirect_to charging_sessions_path
      flash.now[:alert] = 'Ошибка создания сессии'
    end
	end

	def stop
		@charging_session.update!(updated_at: Time.current) 
		redirect_to charging_session_path(@charging_session)
	end

	private

	def find_session
		@charging_session = ChargingSession.find(params[:id])
	end

	def charging_session_params
    params.require(:charging_session).permit(:connector_id, :client_id)
  end
end


