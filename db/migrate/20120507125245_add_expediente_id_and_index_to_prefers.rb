class AddExpedienteIdAndIndexToPrefers < ActiveRecord::Migration
  def change
    add_column :prefers, :expediente_id, :integer
    add_index  :prefers, :expediente_id
    add_index  :prefers, :numero
  end
end

