class CreateUserDoctors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_doctors do |t|
      t.references :user, foreign_key: true
      t.bigint :doctor_id
      t.datetime :schedule_date
      t.integer :status

      t.timestamps
    end
  end
end
