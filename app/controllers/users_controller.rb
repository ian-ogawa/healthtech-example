class UsersController < ApplicationController
	def index
		@doctors = User.includes(:hospitals).role_doctors
	end

	def show
		@doctor = User.includes(:hospitals).find_by(id: params[:id], role: :doctor)
	end
end