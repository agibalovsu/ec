class ChargingSession < ApplicationRecord
	belongs_to :client
	belongs_to :connector
end
