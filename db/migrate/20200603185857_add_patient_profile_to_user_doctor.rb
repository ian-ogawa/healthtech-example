class AddPatientProfileToUserDoctor < ActiveRecord::Migration[5.2]
  def change
    add_column :user_doctors, :name, :string
    add_column :user_doctors, :email, :string
    add_column :user_doctors, :phone, :string
    add_column :user_doctors, :birth_date, :date
    add_column :user_doctors, :notes, :text
  end
end
