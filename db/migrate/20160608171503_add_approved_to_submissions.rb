class AddApprovedToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :approved_at, :datetime
  end
end
