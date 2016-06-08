class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.references :user, null: false
      t.integer    :project_id, null: false

      t.timestamps
    end
  end
end
