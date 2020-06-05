class HospitalsController < ApplicationController
	def index
		@hospitals = Hospital.all
	end

	def show
		@hospital = Hospital.includes(doctor_hospitals: :doctor).find_by(id: params[:id])
	end

	def add_hospitals
		doctor_hospital = current_user.doctor_hospitals.new(hospital_id: params[:hospital_id])

		if doctor_hospital.save
			redirect_to hospital_url(params[:hospital_id]), :notice => "added as my hospital."
		else
			redirect_to hospital_url(params[:hospital_id]), :alert => "#{doctor_hospital.errors.full_messages.join(', ')}"
		end
	end
end