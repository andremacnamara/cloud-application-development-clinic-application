class AddConsultationToPatients < ActiveRecord::Migration
  def change
        add_column :patients, :consultationType, :text
  end
end
