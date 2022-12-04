class Client < ApplicationRecord
	has_one :charging_session, dependent: :destroy
end
