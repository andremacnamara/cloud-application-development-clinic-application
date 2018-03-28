class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      
      t.string    :name,      null: false
      t.integer   :age,       null: false
      t.string    :phone,     null: false
      t.string    :ailment,   null: false
      t.datetime  :apointment,  null: false
      t.string    :status,    null: false
      
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
