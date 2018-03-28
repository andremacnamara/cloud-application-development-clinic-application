class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :date
      t.text :report
      
      t.timestamps
    end
  end
end