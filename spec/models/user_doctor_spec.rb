# == Schema Information
#
# Table name: user_doctors
#
#  id            :bigint           not null, primary key
#  schedule_date :datetime
#  status        :integer
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
require 'rails_helper'

RSpec.describe UserDoctor, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
