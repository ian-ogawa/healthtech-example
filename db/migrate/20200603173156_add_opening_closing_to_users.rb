class AddOpeningClosingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :opening, :time
    add_column :users, :closing, :time
  end
end
