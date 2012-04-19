class AddExpedienteIdToSesions < ActiveRecord::Migration
  def change
    add_column :sesions, :expediente_id, :integer
    add_index :sesions, :expediente_id
  end
end

