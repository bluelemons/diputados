class AddFieldsToSessions < ActiveRecord::Migration
  def change
    add_column :sessions, :numero_de_reunion, :integer
    add_column :sessions, :session_type_id, :integer
  
    add_index :sessions, :session_type_id
  end
end
