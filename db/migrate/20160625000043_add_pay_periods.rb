class AddPayPeriods < ActiveRecord::Migration
  def change
    create_table :pay_periods do |t|
      t.string :number, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.datetime :timesheet_due_at, null: false
      t.datetime :pay_day_at, null: false
    end
  end
end
