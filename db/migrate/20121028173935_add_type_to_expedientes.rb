class AddTypeToExpedientes < ActiveRecord::Migration
  def change
    add_column :expedientes, :type, :string
    add_index  :expedientes, :type
  end
end

