class MedicinesController < ApplicationController
  def new
  	@medicine = Medicine.new
  end

  def create
  	@medicine = Medicine.new(medicine_params)
  	respond_to do |format|
	  	if @medicine.save
	  		format.html { redirect_to users_path }
	  	else
	  		format.html { render :new}
	  	end
	  end
  end

  private
    def medicine_params
    	params.require(:medicine).permit(:name)
    end
end