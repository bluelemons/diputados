class CreatePases < ActiveRecord::Migration
  def change
    create_table :pases do |t|
      t.belongs_to :expediente
      t.belongs_to :area
      t.date :ingreso
      t.integer :fojas

      t.timestamps
    end
    add_index :pases, :expediente_id
    add_index :pases, :area_id
  end
end
