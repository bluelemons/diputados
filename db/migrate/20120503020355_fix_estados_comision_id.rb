class FixEstadosComisionId < ActiveRecord::Migration
  def change
    rename_column :estados, :comision, :comision_id
    add_index :estados, :comision_id
  end
end

