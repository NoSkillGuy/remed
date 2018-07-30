class UserMedicineTimersController < ApplicationController
	def new
		@user_medicine_timer = UserMedicineTimer.new
		if params['user_medicine_id'].present?
			@user_medicine = UserMedicine.find_by(id: params['user_medicine_id'].to_i)
			if @user_medicine.present?
				@user = @user_medicine.user
				@medicine = @user_medicine.medicine
				@user_medicine_timer.user_medicine_id = @user_medicine.id
			end
		end
	end

	def create
		@user_medicine_timer = UserMedicineTimer.new(user_medicine_timer_params)
    @user = @user_medicine_timer.user_medicine.user
		respond_to do |format|
	      if @user_medicine_timer.save
	        format.html { redirect_to @user, notice: 'User Medicine Timer got successfully saved' }
	      else
	        format.html { redirect_to action: 'new', user_medicine_id: user_medicine_timer_params[:user_medicine_id], notice: 'User Medicine Time not saved' }
	      end
	    end
	end

	private
		def user_medicine_timer_params
			params.require(:user_medicine_timer).permit(:user_medicine_id, :medicine_time, :repeat, :repeat_until)
		end
end
