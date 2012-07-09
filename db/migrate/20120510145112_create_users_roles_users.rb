class CreateUsersRolesUsers < ActiveRecord::Migration
  def change
    create_table :admin_users_roles, :id => false do |t|
      t.integer :admin_user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
