class AddIndexesToExpedientes < ActiveRecord::Migration
  def change
    add_index :expedientes, [:numero, :pasada, :letra, :tipo]
  end
end

