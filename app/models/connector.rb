class Connector < ApplicationRecord
	belongs_to :sharging_station
	belongs_to :sharging_session
end
