class ChargingStation < ApplicationRecord
	belongs_to :point
	has_many :connectors, dependent: :destroy
end
