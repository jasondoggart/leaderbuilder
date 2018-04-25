class AddPcIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :pc_id, :integer
  end
end
