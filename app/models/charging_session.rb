class ChargingSession < ApplicationRecord
	belongs_to :client
	belongs_to :connector

	validates :connector_id, :client_id, presence: true

	validate :validate_condition, on: :create

	def change_condition_start
		connector.condition = 'busy'
	end

	def change_condition_stop
		connector.condition = 'free'
	end

	def count_of_power
		((self.updated_at - self.created_at) * connector.power)/3600
	end

	def validate_condition
    errors.add(connector.condition, 'condition must be free') if connector.condition != 'free'
  end
end
