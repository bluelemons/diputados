class RemoveSessions < ActiveRecord::Migration
  def up
    drop_table :sessions
  end

  def down
    create_table :sessions do |t|
      t.date :fecha
      t.integer :numero_de_periodo
      t.integer :numero_de_sesion

      t.timestamps
    end
  end
end
