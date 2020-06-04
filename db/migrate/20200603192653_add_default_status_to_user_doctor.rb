class AddDefaultStatusToUserDoctor < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :user_doctors, :status, 0
  end
end
