class AddOrganizationInNotas < ActiveRecord::Migration
  def change
    add_column :expedientes, :organization_id, :integer

    add_index :expedientes, :organization_id
  end
end
