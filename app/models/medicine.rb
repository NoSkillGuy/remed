class Medicine < ApplicationRecord
	has_many :user_medicines
	has_many :users, through: :user_medicines
end
