class AddIniciatorToExpediente < ActiveRecord::Migration
  def change
    add_column :expedientes, :initiator_id, :integer
    add_index :expedientes, :initiator_id
  end
end
