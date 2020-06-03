# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :doctor_hospitals, dependent: :destroy
	has_many :hospitals, through: :doctor_hospitals

  has_many :doctor_users, class_name: 'UserDoctor', foreign_key: 'doctor_id', dependent: :destroy
  has_many :doctors, through: :doctor_users

  has_many :user_doctors, dependent: :destroy
  has_many :customers, through: :user_doctors

	enum role: [:customer, :doctor]
end
