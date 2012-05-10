class AddTemaIdToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :tema_id, :integer
    add_index :expedientes, :tema_id

  end
end
