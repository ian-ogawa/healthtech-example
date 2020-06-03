# == Schema Information
#
# Table name: doctor_hospitals
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  hospital_id :bigint
#  user_id     :bigint
#
# Indexes
#
#  index_doctor_hospitals_on_hospital_id  (hospital_id)
#  index_doctor_hospitals_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (hospital_id => hospitals.id)
#  fk_rails_...  (user_id => users.id)
#
class DoctorHospital < ApplicationRecord
  belongs_to :doctor, class_name: 'User', foreign_key: 'user_id'
  belongs_to :hospital
end
