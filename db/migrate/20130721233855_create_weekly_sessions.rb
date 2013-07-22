class CreateWeeklySessions < ActiveRecord::Migration
  def change
    create_table :weekly_sessions do |t|
      t.integer :numero_de_sesion
      t.integer :numero_de_periodo
      t.belongs_to :session_type
      t.integer :numero_de_reunion

      t.timestamps
    end
    add_index :weekly_sessions, :session_type_id
  end
end
