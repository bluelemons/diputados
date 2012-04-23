class AddEstadoIdToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :estado_id, :integer
    add_index :expedientes, :estado_id
  end
end

