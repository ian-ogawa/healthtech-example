class UsersController < ApplicationController
	def index
		@doctors = User.includes(:hospitals).users_doctors
	end
end