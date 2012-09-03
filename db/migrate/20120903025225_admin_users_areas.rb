class AdminUsersAreas < ActiveRecord::Migration
  def change
    create_table :admin_users_areas, :id => false do |t|
      t.integer :admin_user_id
      t.integer :area_id
    end
  end
end
