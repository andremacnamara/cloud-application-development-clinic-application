class AddPatientIdToCreateReports < ActiveRecord::Migration
  def change
    add_column :reports, :patient_id, :integer
  end
end
