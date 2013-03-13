class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.date :fecha
      t.integer :numero_de_periodo

      t.timestamps
    end

    add_column :pases, :session_id, :integer
    add_index  :pases, :session_id
  end
end
