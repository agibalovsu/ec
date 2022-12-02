class Point < ApplicationRecord
	has_many :charging_stations
	has_many :charging_sessions
end
