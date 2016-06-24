class AddMetaToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :accomplishments, :text
    add_column :submissions, :goals, :text
    add_column :submissions, :challenges, :text
  end
end
