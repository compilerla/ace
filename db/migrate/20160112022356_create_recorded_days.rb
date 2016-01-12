class CreateRecordedDays < ActiveRecord::Migration
  def change
    create_table :recorded_days do |t|
      t.timestamp :submitted_at
      t.references :period, null: false

      t.timestamps null: false
    end
  end
end
