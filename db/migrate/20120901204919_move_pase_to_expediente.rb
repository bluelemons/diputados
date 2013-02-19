class MovePaseToExpediente < ActiveRecord::Migration
  def up
    add_column :pases, :expediente_id, :integer
    remove_column :pases, :nota_id
  end
end
