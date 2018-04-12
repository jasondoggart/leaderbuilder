class FixMinistryDirectorColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :ministries, :director, :director_id
  end
end
