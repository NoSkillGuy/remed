class UserMedicinesController < ApplicationController
	before_action :set_user_medicine, only: [:show, :edit, :update, :destroy]

	def new
		@user_medicine = UserMedicine.new
		if params['user_id'].present?
			@user = User.find_by_id(params['user_id'].to_i)
			@user_medicine.user_id = @user.id if @user.present?
		end
	end

	def create
		@user_medicine = UserMedicine.new(user_medicine_params)
    p user_medicine_params
    # @user = User.find_by_userwhere_id(user_medicine_params[:user_id].to_i)
    @user = User.where(id: user_medicine_params[:user_id].to_i).first
		respond_to do |format|
	      if @user_medicine.save
	        format.html { redirect_to @user, notice: 'Medicine got successfully added to user' }
	      else
	        format.html { render :new }
	      end
	    end
	end
	private
	  def set_user_medicine
	  	@user = User.find(params[:user_id])
	  	@medicine = Medicine.find(params[:medicine_id])
	  end

	  def user_medicine_params
	  	params.require(:user_medicine).permit(:user_id, :medicine_id)
	  end
end