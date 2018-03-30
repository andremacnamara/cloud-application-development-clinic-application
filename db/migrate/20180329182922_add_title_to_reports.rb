class AddTitleToReports < ActiveRecord::Migration
  def change
    add_column :reports, :title, :text
  end
end
