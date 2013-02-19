class AddPrimerYUltimoPaseToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :primer_pase_id, :integer
    add_column :expedientes, :ultimo_pase_id, :integer
  end
end
