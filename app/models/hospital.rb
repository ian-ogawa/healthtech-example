# == Schema Information
#
# Table name: hospitals
#
#  id           :bigint           not null, primary key
#  name         :string
#  descriptions :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Hospital < ApplicationRecord
end
