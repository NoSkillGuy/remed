class UserMedicineTimer < ApplicationRecord
	belongs_to :user_medicine
  validates :user_medicine_id, :medicine_time, uniqueness: { scope: [:medicine_time]}
end
