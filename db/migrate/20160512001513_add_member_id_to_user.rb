class AddMemberIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :member_id, :integer, null: false
  end
end
