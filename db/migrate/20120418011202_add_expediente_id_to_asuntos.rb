class AddExpedienteIdToAsuntos < ActiveRecord::Migration
  def change
    add_column :asuntos, :expediente_id, :integer
    add_index :asuntos, :expediente_id
  end
end

