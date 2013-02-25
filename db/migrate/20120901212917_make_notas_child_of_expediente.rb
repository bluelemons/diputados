class MakeNotasChildOfExpediente < ActiveRecord::Migration
  def up
    add_column :expedientes, :type, :string
  end
end
