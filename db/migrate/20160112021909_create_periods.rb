class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.timestamp :submitted_at

      t.timestamps null: false
    end
  end
end
