class AddDirectorToMinistries < ActiveRecord::Migration[5.1]
  def change
    add_column :ministries, :director, :integer
  end
end
