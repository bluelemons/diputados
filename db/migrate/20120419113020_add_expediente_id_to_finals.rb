class AddExpedienteIdToFinals < ActiveRecord::Migration
  def change
    add_column :finals, :expediente_id, :integer
    add_index :finals, :expediente_id
  end
end

