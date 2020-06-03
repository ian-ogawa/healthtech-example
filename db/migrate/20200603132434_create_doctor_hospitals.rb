class CreateDoctorHospitals < ActiveRecord::Migration[5.2]
  def change
    create_table :doctor_hospitals do |t|
      t.references :user, foreign_key: true
      t.references :hospital, foreign_key: true

      t.timestamps
    end
  end
end
