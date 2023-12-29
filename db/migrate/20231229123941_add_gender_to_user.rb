class AddGenderToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :gender, :integer
  end
end
