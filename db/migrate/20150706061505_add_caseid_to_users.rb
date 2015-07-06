class AddCaseidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :caseid, :integer
  end
end
