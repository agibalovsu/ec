class Connector < ApplicationRecord
	belongs_to :charging_station
	has_one :charging_session

	validates :connector_type, inclusion: { in: %w(CHAdeMO CCS_COMBO_2 Type_2), 
		message: "Valide connector_type is: 'CHAdeMO', 'CCS_COMBO_2', 'Type_2' "}

	validates :condition, inclusion: { in: %w(disable free busy), 
		message: "Valid condition is: 'disable', 'free', 'busy'"}
end
