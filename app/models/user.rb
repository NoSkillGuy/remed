class User < ApplicationRecord
	has_many :user_medicines
	has_many :medicines, through: :user_medicines
	has_many :user_medicine_timers, through: :user_medicines
end
