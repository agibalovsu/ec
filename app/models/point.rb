class Point < ApplicationRecord
	has_many :charging_stations, dependent: :destroy
	has_many :charging_sessions, dependent: :destroy
end
