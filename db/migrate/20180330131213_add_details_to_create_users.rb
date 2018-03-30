class AddDetailsToCreateUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :text
    add_column :users, :clinicAddresss, :text
  end
end