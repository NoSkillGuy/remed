class UserMedicine < ApplicationRecord
	belongs_to :user
	belongs_to :medicine
	has_many :user_medicine_timers
	validates :user, uniqueness: { scope: [:medicine] }
end
