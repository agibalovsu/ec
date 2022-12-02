class ChargingSession < ApplicationRecord
	belongs_to :client
	belongs_to :connector
	belongs_to :point

	def start?
		client.persisted? && connector.condition == 'free'
	end

	def start
		if charging_session.start?
			connector.condition == 'busy'
		end
	end

	def stop
		count_of_power = (charging_session.created_at - Time.now) * connector.power
		connector.condition == 'free'
	end
end
