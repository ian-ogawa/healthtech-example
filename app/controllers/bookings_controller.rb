class BookingsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bookings = current_user.role.eql?('customer') ? current_user.user_doctors : current_user.doctor_users
	end

	def update
		booking = UserDoctor.find_by(id: params[:id])

		if booking.present?
			if booking.update(status: params[:status])
				redirect_to bookings_path, :notice => "Update success."
			else
				redirect_to bookings_path, :warning => "Failed please try again later."
			end
		else
			redirect_to bookings_path, :warning => "Booking data not found."
		end
	end

	def create
		is_valid_time = UserDoctor.is_valid_time?(book_params)
		if is_valid_time
			books = current_user.user_doctors.new(book_params)

			if books.save
				redirect_to bookings_path, :notice => "Booking success."
			else
				redirect_to "/doctor/#{book_params[:doctor_id]}", :alert => "#{books.errors.full_messages.join(', ')}"
			end
		else
			redirect_to "/doctor/#{book_params[:doctor_id]}", :alert => "Please choose another date. Doctor are full booked or you book less than 30 minutes before opening time"
		end
	end

	private

	def book_params
		params.require(:user_doctor).permit(:schedule_date, :name, :phone, :email, :birth_date, :notes, :doctor_id)
	end
end