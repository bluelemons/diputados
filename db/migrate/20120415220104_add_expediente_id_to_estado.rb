class AddExpedienteIdToEstado < ActiveRecord::Migration
  def change
    add_column :estados, :expediente_id, :integer
    add_index :estados, :expediente_id
  end
end

