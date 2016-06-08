class AddSubmissionIdToHoursLog < ActiveRecord::Migration
  def up
    HoursLog.destroy_all
    add_column :hours_logs, :submission_id, :integer, null: false
    remove_column :hours_logs, :project_id
  end
end
