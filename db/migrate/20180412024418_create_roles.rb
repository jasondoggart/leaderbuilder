class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :role_type
      t.integer :team_member_id
      t.references :ministry, foreign_key: true

      t.timestamps
    end
  end
end
