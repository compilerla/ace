class CreateHoursLogs < ActiveRecord::Migration
  def change
    create_table :hours_logs do |t|
      t.date :date, null: false
      t.float :hours, null: false
      t.integer :project_id
      t.integer :user_id
      t.string :log_type, null: false
      t.string :service_type
    end
  end
end
