module UserHelper
	def get_default_date(doctor)
		open_book = doctor.get_total_open_book
		opening_time = doctor.get_opening_time

		open_book <= 10 && (opening_time - Time.now) > 30.minutes ? Date.today : Date.today + 1.day
	end
end