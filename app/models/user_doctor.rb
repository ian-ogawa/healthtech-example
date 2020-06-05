# == Schema Information
#
# Table name: user_doctors
#
#  id            :bigint           not null, primary key
#  birth_date    :date
#  email         :string
#  name          :string
#  notes         :text
#  phone         :string
#  schedule_date :datetime
#  status        :integer          default("booked")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  doctor_id     :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_user_doctors_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserDoctor < ApplicationRecord
  belongs_to :customer, class_name: 'User', foreign_key: 'user_id'
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'

  validates_presence_of :name, :birth_date, :schedule_date, :phone

  enum status: [:booked, :completed, :cancelled]

  scope :open_book, -> { where(status: :booked) }

  def self.is_valid_time?(params)
    # byebug
  	doctor = User.find_by(id: params[:doctor_id], role: :doctor)
    # byebug
  	book_date = Time.new(params["schedule_date(1i)"].to_i, params["schedule_date(2i)"].to_i, params["schedule_date(3i)"].to_i, Time.now.strftime('%H'), Time.now.strftime('%M'))
  	total_open_book = doctor.get_total_open_book
		opening_time = doctor.get_opening_time

		total_open_book <= 10 && (opening_time - Time.now) > 30.minutes
  end
end
